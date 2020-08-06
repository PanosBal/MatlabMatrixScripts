function matrix2latex2(matrix, filename, varargin)
% Example input:
%   matrix = [1.5 1.764; 3.523 0.2];
%   rowLabels = {'row 1', 'row 2'};
%   columnLabels = {'col 1', 'col 2'};
%   matrix2latex(matrix, 'out.tex', 'rowLabels', rowLabels, 'columnLabels', columnLabels, 'alignment', 'c', 'format', '%-6.2f', 'size', 'tiny');

    Mstyle=[];
    rowLabels = [];
    colLabels = [];
    alignment = 'l';
    format = [];
    textsize = [];
    if (rem(nargin,2) == 1 || nargin < 2)
        error('matrix2latex2: ', 'Incorrect number of arguments to %s.', mfilename);
    end
    okargs = lower({'rowlabels','columnlabels', 'alignment', 'format', 'size','Mstyle'});%ch
    for j=1:2:(nargin-2)
        pname = varargin{j};
        pval = varargin{j+1};
        k = strmatch(lower(pname), okargs);
        if isempty(k)
            error('matrix2latex2: ', 'Unknown parameter name: %s.', pname);
        elseif length(k)>1
            error('matrix2latex2: ', 'Ambiguous parameter name: %s.', pname);
        else
            switch(k)
                case 1  % rowlabels
                    rowLabels = pval;
                    if isnumeric(rowLabels)
                        rowLabels = cellstr(num2str(rowLabels(:)));
                    end
                case 2  % column labels
                    colLabels = pval;
                    if isnumeric(colLabels)
                        colLabels = cellstr(num2str(colLabels(:)));
                    end
                case 3  % alignment
                    alignment = lower(pval);
                    if alignment == 'right'
                        alignment = 'r';
                    end
                    if alignment == 'left'
                        alignment = 'l';
                    end
                    if alignment == 'center'
                        alignment = 'c';
                    end
                    if alignment ~= 'l' && alignment ~= 'c' && alignment ~= 'r'
                        alignment = 'l';
                        warning('matrix2latex2: ', 'Unkown alignment. (Set it to \''left\''.)');
                    end
                case 4  % format
                    format = lower(pval);
                case 5  % format
                    textsize = pval;
                case 6 %ch
                    Mstyle=pval;
            end
        end
    end
    
    myFilename = sscanf(filename,'%s.txt');%gia na vgainei sosta se txt
    temp='.txt';
    myFilename=append(myFilename,temp);
    fid = fopen(myFilename, 'w');
    
    width = size(matrix, 2);
    height = size(matrix, 1);
    if isnumeric(matrix)
        matrix = num2cell(matrix);
        for h=1:height
            for w=1:width
                if(~isempty(format))
                    matrix{h, w} = num2str(matrix{h, w}, format);
                else
                    matrix{h, w} = num2str(matrix{h, w});
                end
            end
        end
    end
    
    if(~isempty(textsize))
        fprintf(fid, '\\begin{%s}', textsize);
    end
    
 if(Mstyle=='tabular')    
    fprintf(fid, '\\begin{tabular}{|');%tabular----------------------------
    if(~isempty(rowLabels))
        fprintf(fid, 'l|');
    end
    for i=1:width
        fprintf(fid, '%c|', alignment);
    end
    fprintf(fid, '}\r\n'); 
    fprintf(fid, '\\hline\r\n');
    if(~isempty(colLabels))
        if(~isempty(rowLabels))
            fprintf(fid, '&');
        end
        for w=1:width-1
            fprintf(fid, '\\textbf{%s}&', colLabels{w});
        end
        fprintf(fid, '\\textbf{%s}\\\\\\hline\r\n', colLabels{width});
    end
    for h=1:height
        if(~isempty(rowLabels))
            fprintf(fid, '\\textbf{%s}&', rowLabels{h});
        end
        for w=1:width-1
            fprintf(fid, '%s&', matrix{h, w});
        end
        fprintf(fid, '%s\\\\\\hline\r\n', matrix{h, width});
    end
    fprintf(fid, '\\end{tabular}\r\n');%tabular----------------------------
 end
 
 if(Mstyle == 'pmatrix')
     fprintf(fid, '\\begin{pmatrix}\n');
 elseif (Mstyle == 'bmatrix')
     fprintf(fid, '\\begin{bmatrix}\n');
 elseif (Mstyle == 'vmatrix')
     fprintf(fid, '\\begin{vmatrix}\n');
 end
 if(Mstyle ~= 'tabular' )
     for h=1:height
         for w=1:width-1
             fprintf(fid, '%s&', matrix{h, w});
         end
         fprintf(fid, '%s\\\\\n', matrix{h, width});
     end
 end
 if(Mstyle == 'pmatrix')
     fprintf(fid, '\\end{pmatrix}');
 elseif (Mstyle == 'bmatrix')
     fprintf(fid, '\\end{bmatrix}');
 elseif (Mstyle == 'vmatrix')
     fprintf(fid, '\\end{vmatrix}');
 end
        

   
 
    if(~isempty(textsize))
        fprintf(fid, '\\end{%s}', textsize);
    end
    fclose(fid);
