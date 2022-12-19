# Image-compression-using-Scilab

There are mainly two types of image compression:
i) Lossless image compression
ii) Lossy image compression
The type of image compression is based upon image file resizing process. In the first type, the image quality remains intact and in the second type, the image quality gets affected.
There are various methods by which we can compress the image. Here I used Singular Value Decomposition (SVD) technique to compress the image and we have implemented that in scilab. Scilab, famous open – source scientific computation software, can be used to test algorithm or to perform numerical computation.

The process of Singular Value Decomposition (SVD) involves breaking down a matrix A into the form . This computation allows us to retain the important singular values that the image requires while also releasing the values that are not as necessary in retaining the quality of the image.

The SVD of mxn matrix A is given by the formula 
 A = UWV^{T} 
where: 
U: mxn matrix of the orthonormal eigenvectors of AA^{T} 
VT: transpose of a nxn matrix containing the orthonormal eigenvectors of A^{T}A. 
W: a nxn diagonal matrix of the singular values which are the square roots of the 
eigenvalues of A^{T}A
