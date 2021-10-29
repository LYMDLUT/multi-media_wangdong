function demo_svd

imRGB  = imread('imrgb.jpg');
imGray = double(rgb2gray(imRGB));
figure(1),imshow(imGray, [0 255]);
%
[U,S,V] = svd(imGray);
s = diag(S);
tr = 50;
imRec = U(:,1:tr)*diag(s(1:tr))*V(:,1:tr)';
figure(2),imshow(imRec, [0 255]);
errorRate = norm(imRec(:)-imGray(:))/norm(imGray(:));
compressRate = (size(imGray,1)*size(imGray,2))/(size(imGray,1)*tr+size(imGray,2)*tr+tr);