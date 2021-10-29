function filter = myfir_window(taps, wn, win)
%%taps:  filter taps = filter length – 1;
%%wn: normalized frequency: the range o~1 presents the real range 0~fs/2
%%win:  window function

wn = 
N = taps + 1;                      %%Filter Length
%%设计对应的理想低通滤波器
n = 0:N-1;
ir = sinc(wn*(n-(N-1)/2));   %%Impulse Response of the idea low pass filter
%%加窗
ir = ir.*win;                         %%Multiple by the window function
%%归一化
filter = ir./sum(ir);              %%Normalize the impulse responce
