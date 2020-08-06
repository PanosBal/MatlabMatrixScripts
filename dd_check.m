function [dflag,discrC,discrR] = dd_check(A)
%Author: Παναγιώτης Μπαλταγιάννης, ΑΜ:5591, Date:23/12/2019

flagStrictRow=0;
flagStrictColumn=0;

% apoluti timi diagoniou
absDiag  = abs(diag(A));
%apoluti timi athroismatos kathe grammis ektos apo ti diagonio
absRow = sum(abs(A), 2) - absDiag; 
%apoluti timi athroismatos kathe stilis ektos apo ti diagonio
absColumn= transpose(sum(abs(A),1))- absDiag;

%elegxos giagonias kuriarxias
flagRow = all(absRow <= absDiag);%all:Determine if all array elements are nonzero or true
flagColumn = all(absColumn <= absDiag);
dflag=flagRow&flagColumn;

%elegxos afstiris diagonias kuriarxias
if flagRow==1
    flagStrictRow = any(absRow  >= absDiag);
end
if flagColumn==1
    flagStrictColumn=any(absColumn  >= absDiag);
end
flagStrict= flagStrictRow & flagStrictColumn;

%elegxos afstiris diagonias kuriarxias stilis
tempDiscrC=absDiag-absColumn;
indicesC = find(tempDiscrC>0);
discrC=length(indicesC);

%elegxos afstiris diagonias kuriarxias grammon
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