I1 = checkerboard(400);
I2=I1(:); %��ԭʼͼ��д��һά�����ݲ���Ϊ I2
I2length=length(I2); %���� I2�ĳ���
I3=im2bw(I1,0.5); %��ԭͼת��Ϊ��ֵͼ����ֵΪ 0.5
X=I3(:); %�� XΪ�½��Ķ�ֵͼ���һά������
L=length(X);
j=1;
I4(1)=1;
for z=1:1:(length(X)-1) %�г̱�������
if X(z)==X(z+1)
I4(j)=I4(j)+1;
else
end
data(j)=X(z); % data(j)������Ӧ����������
j=j+1;
I4(j)=1;
end
data(j)=X(length(X)); %���һ���������ݸ��� data
I4length=length(I4); %�����г̱�������ռ�ֽ�������Ϊ I4length
l=1;
for m=1:I4length
for n=1:1:I4(m);
decode_image1(l)=data(m);
l=l+1;
end
end
decode_image=reshape(decode_image1,[3200,3200]); %�ؽ���άͼ������
h=figure; subplot(131);imshow(I1);title('ԭʼͼ��'); %��ʾԭͼ�Ķ�ֵͼ��
subplot(132);imshow(I3);title('ԭͼ�Ķ�ֵͼ��'); %��ʾԭͼ�Ķ�ֵͼ��
subplot(133);imshow(decode_image);title('��ѹ�ָ����ͼ��'); %��ʾ��ѹ�ָ����ͼ��
disp('ԭͼ�����ݵĳ��ȣ�')
disp(L);
disp('ѹ����ͼ�����ݵĳ��ȣ�')
disp(I4length);
disp('��ѹ��ͼ�����ݵĳ��ȣ�')
disp(length(decode_image1));

 
