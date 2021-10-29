%%读取文件：
fileName = 'I could be the one';
[ data fs  ] = audioread([ fileName '.wav' ]);
%%剪切文件：
t = 30;  %%取前10s
oldData = data(1:t*fs,:);
%%播放文件：
%sound(oldData, fs);
%%采样率转换：
rate = 1.1;
newFs = rate*fs;
newData1 = src_general_scale(oldData(:,1)', rate,...
                             zeros(1,25), @blackman_nuttall_function);
newData2 = src_general_scale(oldData(:,2)', rate,...
                             zeros(1,25), @blackman_nuttall_function);
newData = [ newData1' newData2' ];
sound(newData, newFs);
audiowrite('I could be the one new.wav',newData./max(newData), uint16(newFs));

