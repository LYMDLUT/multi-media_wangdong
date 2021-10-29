fsIN  = 48e3;  fsOUT = 44.1e3;
M = 512;    %%总采样点数
N = 0:M-1;
fc = 1e3;
inputData  = sin(2*pi*fc/fsIN*N);%%产生频率为1KHz的正弦波  
%%采样频率转换
outputData = src_general_scale(inputData, fsOUT/fsIN,...
                               zeros(1,25), @blackman_nuttall_function);
figure;
subplot(2,2,1),plot(inputData,'linewidth',2);
title('原始信号时域波形','fontsize',18);
subplot(2,2,2),plot(abs(fft(inputData,M))/M,'linewidth',2);
title('原始信号频域波形','fontsize',18);
subplot(2,2,3),plot(outputData,'linewidth',2);
title('变换后信号时域波形','fontsize',18);
subplot(2,2,4);
plot(abs(fft(outputData,M))/length(outputData),'linewidth',2);
title('变换后信号频域波形','fontsize',18);