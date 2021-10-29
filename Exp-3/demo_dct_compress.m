function demo_dct_compress


imRGB  = imread('imrgb.jpg');
imGray = double(rgb2gray(imRGB));

imDct  = blkproc(imGray,[8 8], @dct2);

imRec  = blkproc(imDct, [8 8], @idct2);

mask = [1 1 1 0 0 0 0 0
             1 1 0 0 0 0 0 0
             1 0 0 0 0 0 0 0
             0 0 0 0 0 0 0 0
             0 0 0 0 0 0 0 0
             0 0 0 0 0 0 0 0
             0 0 0 0 0 0 0 0
             0 0 0 0 0 0 0 0]; 

imDct = blkproc(imDct,[8 8],'P1.*x',mask);
imRec = blkproc(imDct,[8 8], @idct2);


T = dctmtx(8);
imDct = blkproc(imGray,[8 8], 'P1*x*P2',T, T');
imDct = blkproc(imDct,[8 8],'P1.*x',mask);
imRec = blkproc(imDct,[8 8], 'P1*x*P2',T', T);
imshow(imRec,[0 255])