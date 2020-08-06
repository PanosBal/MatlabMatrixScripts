# MatlabMatrixScripts
Matlab scripts which can make your life easier when work with matrices.

# mask_band(Create Band or Block Tridiagonal Matrix)
You can calling this function as mask_band(n,type,p,q).
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
