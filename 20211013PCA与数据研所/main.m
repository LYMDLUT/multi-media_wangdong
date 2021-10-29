clc;
clear all;
%readPath = ['./Yale_64x64_bmp/'];                        %%原始图像读取路径
readPath = ['./orl_48x48/'];                              %%原始图像读取路径
imNum   = 400;
height  = 48;
width   = 48;
data    = zeros(height*width, imNum);   
dirPath = dir([readPath '*.bmp']);
for num = 1:imNum
    imGray      = imread([readPath dirPath(num).name]);
    %data(:,num) = matrix_to_vector(imGray(:,:,1));
    data(:,num) = reshape(imGray(:,:,1),height*width,1);
end
%%  PCA算法
[U, mu] = pca_dw(data, 30, 0);
%%  显示特征脸（montage)
figure;
montage(uint8(reshape(mu,48,48)));
%%  特征提取
fea = U'*(data-repmat(mu,[1,size(data,2)]));
%%  特征重构
rec = U*fea + repmat(mu,[1,size(data,2)]);
%%  对比重构图和原图
figure;
montage(imGray(:,:,1));
figure;
bb=reshape(rec(:,400),48,48);
montage(uint8(bb));
%%  重构误差   
rError = sum(sum((data-rec).^2))/sum(sum((data).^2));
%
cRate  = (size(fea,1)*size(fea,2)+size(mu,1)*size(mu,2)+size(U,1)*size(U,2))/(size(data,1)*size(data,2));

figure;
[U, mu, eRate] = pca_dw(data, size(data,2), 0);
for dim = 1:size(data,2)
    fea = U(:,1:dim)'*(data-repmat(mu,[1,size(data,2)]));
    rec = U(:,1:dim)*fea + repmat(mu,[1,size(data,2)]);
    rError = sum(sum((data-rec).^2))/sum(sum((data).^2));
    cRate  = (size(fea,1)*size(fea,2)+size(mu,1)*size(mu,2)+size(U(:,1:dim),1)*size(U(:,1:dim),2))/(size(data,1)*size(data,2));
    plot(dim, rError, '--rs');
    hold on;
    plot(dim, cRate,  '--b*');
    hold on;
    plot(dim, eRate(dim),  '--mo');
    hold on;
end