function outputData = src_general_scale(inputData, rate, delayLine, window_function)
if  rate == 1
    outputData = inputData;
    return;
end
inLength   = length(inputData);             %%�����źų���
outLength  = floor(inLength*rate);          %%����źų���
inputData  = [ delayLine inputData ];       %%���ӳ�������
outputData = zeros(1,outLength);            %%�������
q = length(delayLine-1)/2;                  %%�ӳ������ֵ�������ϵ
for num = 1:outLength
    t  = (num-1)/rate;                      %%n/a
    tr = round(t);                          %%rounding(n/a)
    %%�������
    temp = 0;
    for k = 1:2*q+1
        if  abs((q+1)+(t-tr)-k) >= q        %%��Ч���䣺-q~q
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