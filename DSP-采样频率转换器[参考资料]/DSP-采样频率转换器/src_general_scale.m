function outputData = src_general_scale(inputData, rate, delayLine, window_function)
if  rate == 1
    outputData = inputData;
    return;
end
inLength   = length(inputData);             %%输入信号长度
outLength  = floor(inLength*rate);          %%输出信号长度
inputData  = [ delayLine inputData ];       %%加延迟线数据
outputData = zeros(1,outLength);            %%输出数据
q = length(delayLine-1)/2;                  %%延迟线与插值点个数关系
for num = 1:outLength
    t  = (num-1)/rate;                      %%n/a
    tr = round(t);                          %%rounding(n/a)
    %%卷积过程
    temp = 0;
    for k = 1:2*q+1
        if  abs((q+1)+(t-tr)-k) >= q        %%有效区间：-q~q
            continue;
        end
        if  rate > 1
            xT = inputData(tr+k);
            sincT = sinc((q+1)+(t-tr)-k);
            wT = window_function(2*q+1, (q+1)+(t-tr)-k);
            temp = temp + xT*sincT*wT;
        else
            xT = inputData(tr+k);
            sincT = sinc(rate*((q+1)+(t-tr)-k));
            wT = window_function(2*q+1, (q+1)+(t-tr)-k);
            temp = temp + rate*xT*sincT*wT;
        end
    end
    outputData(num) = temp;
end