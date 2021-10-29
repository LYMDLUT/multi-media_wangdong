function demo_dct

imRGB  = imread('imrgb.jpg');
imGray = double(rgb2gray(imRGB));
figure(1),imshow(imGray, [0 255]);
imDct  = dct2(imGray);
figure(2),imshow(abs(imDct), [0 255]);
imRec  = idct2(imDct);
figure(3),imshow(imRec,[0 255]);
%
sz = [100, 100]; 
imDctN = imDct(1:sz(1),1:sz(2));
imRecN = idct2(imDctN, size(imGray));
figure(4),imshow(imRecN, [0 255]);
errorRate = norm(imRecN(:)-imGray(:))/norm(imGray(:));
compressRate = (size(imGray,1)*size(imGray,2))/(sz(1)*sz(2));