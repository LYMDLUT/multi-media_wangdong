I1 = checkerboard(400);
I2=I1(:); %将原始图像写成一维的数据并设为 I2
I2length=length(I2); %计算 I2的长度
I3=im2bw(I1,0.5); %将原图转换为二值图像，阈值为 0.5
X=I3(:); %令 X为新建的二值图像的一维数据组
L=length(X);
j=1;
I4(1)=1;
for z=1:1:(length(X)-1) %行程编码程序段
if X(z)==X(z+1)
I4(j)=I4(j)+1;
else
end
data(j)=X(z); % data(j)代表相应的像素数据
j=j+1;
I4(j)=1;
end
data(j)=X(length(X)); %最后一个像素数据赋给 data
I4length=length(I4); %计算行程编码后的所占字节数，记为 I4length
l=1;
for m=1:I4length
for n=1:1:I4(m);
decode_image1(l)=data(m);
l=l+1;
end
end
decode_image=reshape(decode_image1,[3200,3200]); %重建二维图像数组
h=figure; subplot(131);imshow(I1);title('原始图像'); %显示原图的二值图像
subplot(132);imshow(I3);title('原图的二值图像'); %显示原图的二值图像
subplot(133);imshow(decode_image);title('解压恢复后的图像'); %显示解压恢复后的图像
disp('原图像数据的长度：')
disp(L);
disp('压缩后图像数据的长度：')
disp(I4length);
disp('解压后图像数据的长度：')
disp(length(decode_image1));

 
