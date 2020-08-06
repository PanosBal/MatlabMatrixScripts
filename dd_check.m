function [dflag,discrC,discrR] = dd_check(A)

flagStrictRow=0;
flagStrictColumn=0;

% absolute value of the diagonial
absDiag  = abs(diag(A));
absRow = sum(abs(A), 2) - absDiag; 
absColumn= transpose(sum(abs(A),1))- absDiag;

%diagonally dominant check
flagRow = all(absRow <= absDiag);%all:Determine if all array elements are nonzero or true
flagColumn = all(absColumn <= absDiag);
dflag=flagRow&flagColumn;

%stricly diagonally dominant check
if flagRow==1
    flagStrictRow = any(absRow  >= absDiag);
end
if flagColumn==1
    flagStrictColumn=any(absColumn  >= absDiag);
end
flagStrict= flagStrictRow & flagStrictColumn;

%stricly diagonally dominant check columns
tempDiscrC=absDiag-absColumn;
indicesC = find(tempDiscrC>0);
discrC=length(indicesC);

%stricly diagonally dominant check rows
tempDiscrR=absDiag-absRow;
indicesR = find(tempDiscrR>0);
discrR=length(indicesR);

if dflag==1 && flagStrictRow==1      
    discrR=0;
end

if dflag==1 && flagStrictColumn==1       
    discrC=0;
end
end
