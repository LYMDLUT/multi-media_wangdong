function out = my7upfirdn(in, filter, L, M)
%%单级SRC的直接实现，类比matlab upfirdn(多相结构)
L=480;
M=441;
fileName = 'I could be the one';
[ data fs  ] = audioread([ fileName '.wav' ]);
%%剪切文件：
t = 30;  %%取前10s
in = data(1:t*fs,:);
filter = myfir_window();
out1 = myupsample(in, L);	%%up sample
out2 = conv(out1, filter);  	%%low pass filter
out  = mydownsample(out2, M);	%%down sample
