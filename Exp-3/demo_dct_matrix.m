function demo_dct_matrix

imRGB  = imread('imrgb.jpg');
imGray = double(rgb2gray(imRGB));
%
imDct  = dct2(imGray);
sz = [500, 500]; 
imDctN = imDct(1:sz(1),1:sz(2));
imRecN = idct2(imDctN, size(imGray));
%
U = dctmtx(size(imGray,1));
V = dctmtx(size(imGray,2));
imDctM = U*imGray*V';
error = norm(imDct(:)-imDctM(:))
imDctMN = imDctM(1:sz(1),1:sz(2));
imRecMN = U(1:sz(1),:)'*imDctMN*V(1:sz(1),:);
error = norm(imRecN(:)-imRecMN(:))



