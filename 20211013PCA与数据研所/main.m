clc;
clear all;
%readPath = ['./Yale_64x64_bmp/'];                        %%ԭʼͼ���ȡ·��
readPath = ['./orl_48x48/'];                              %%ԭʼͼ���ȡ·��
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
%%  PCA�㷨
[U, mu] = pca_dw(data, 30, 0);
%%  ��ʾ��������montage)
figure;
montage(uint8(reshape(mu,48,48)));
%%  ������ȡ
fea = U'*(data-repmat(mu,[1,size(data,2)]));
%%  �����ع�
rec = U*fea + repmat(mu,[1,size(data,2)]);
%%  �Ա��ع�ͼ��ԭͼ
figure;
montage(imGray(:,:,1));
figure;
bb=reshape(rec(:,400),48,48);
montage(uint8(bb));
%%  �ع����   
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