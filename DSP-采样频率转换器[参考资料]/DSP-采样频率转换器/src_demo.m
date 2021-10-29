fsIN  = 48e3;  fsOUT = 44.1e3;
M = 512;    %%�ܲ�������
N = 0:M-1;
fc = 1e3;
inputData  = sin(2*pi*fc/fsIN*N);%%����Ƶ��Ϊ1KHz�����Ҳ�  
%%����Ƶ��ת��
outputData = src_general_scale(inputData, fsOUT/fsIN,...
                               zeros(1,25), @blackman_nuttall_function);
figure;
subplot(2,2,1),plot(inputData,'linewidth',2);
title('ԭʼ�ź�ʱ����','fontsize',18);
subplot(2,2,2),plot(abs(fft(inputData,M))/M,'linewidth',2);
title('ԭʼ�ź�Ƶ����','fontsize',18);
subplot(2,2,3),plot(outputData,'linewidth',2);
title('�任���ź�ʱ����','fontsize',18);
subplot(2,2,4);
plot(abs(fft(outputData,M))/length(outputData),'linewidth',2);
title('�任���ź�Ƶ����','fontsize',18);