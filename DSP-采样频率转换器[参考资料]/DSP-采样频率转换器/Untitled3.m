fileName = 'I could be the one';
[ data, fs   ] = audioread([ fileName '.wav' ]);
t = 10;   %%ȡǰ  10s
oldData = data(1:t*fs,:);
%����˲���
n=-100:1:100;
filter=sin(pi/150*n)./(pi/150*n);
filter(1,101)=1;
%%������ת����
newfs = 48000;
[L,M] = rat(newfs/fs);
out1 = myupfirdn(oldData(:,1), filter, L, M);
out2 =myupfirdn(oldData(:,2), filter, L, M);
out=[out1',out2'];
audiowrite('I could be the one new.wav',out,newfs);


function out = myupfirdn(in, filter, L, M)
%%���� SRC��ֱ��ʵ�֣���� matlab upfirdn(����ṹ)
out1 = myupsample(in, L);    %%up sample
out2 = conv(out1, filter);       %%low pass filter
out   = mydownsample(out2, M);  %%down sample
end
