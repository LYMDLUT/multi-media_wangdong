function out = my7upfirdn(in, filter, L, M)
%%����SRC��ֱ��ʵ�֣����matlab upfirdn(����ṹ)
L=480;
M=441;
fileName = 'I could be the one';
[ data fs  ] = audioread([ fileName '.wav' ]);
%%�����ļ���
t = 30;  %%ȡǰ10s
in = data(1:t*fs,:);
filter = myfir_window();
out1 = myupsample(in, L);	%%up sample
out2 = conv(out1, filter);  	%%low pass filter
out  = mydownsample(out2, M);	%%down sample
