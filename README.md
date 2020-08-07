# MatlabMatrixScripts
Matlab scripts which can make your life easier when work with matrices.

# mask_band
With this script you can create band or block tridiagonal matrices. You can call it as mask_band(n,type,p,q).
                                           - n: size of the matrix
                                           - p: upper bandwidth
                                           - q: lower bandwidth
                                           - type="bdtr" for block tridiagonal matrix or type="band" for band matrix

- Band matrix is a sparse matrix whose non-zero entries are confined to a diagonal band, comprising the main diagonal and zero or more diagonals on either side. 
<p align="center">
  <img src="https://user-images.githubusercontent.com/46083188/89533828-afd62980-d7fc-11ea-9173-72a096f364ac.png">
</p>

- Block tridiagonal matrix is just like the block diagonal matrix a square matrix, having square matrices (blocks) in the lower diagonal, main diagonal and upper diagonal, with all other blocks being zero matrices. 
<p align="center">
  <img src="https://user-images.githubusercontent.com/46083188/89534928-5d960800-d7fe-11ea-8a62-dffdd23db0e4.png">
</p>

# dd_check
Check if a matrix is diagonally dominant and find the grade of the dominant. You call this function as dd_check(A), which A is the name of the matrix that you want to check.
- dflag returns 1 if the matrix is stricly diagonally dominant and 0 if not.
- discrC: Return the grade of the diagonally dominance by collumns.
- discrR: Return the grade of the diagonally dominance by rows.

# matrix2latex2
Τhis function was based on https://www.mathworks.com/matlabcentral/fileexchange/4894-matrix2latex and with it you can have as output a matrix in different latex formats(tabular , pmatrix, bmatrix, vmatrix).
