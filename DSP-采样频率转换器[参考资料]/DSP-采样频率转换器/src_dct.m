function [ out realRate ] = src_dct(in, rate, bufferSize)
%%利用离散余弦变换(DCT)实现采样频率转换(Sample Rate Conversion)
%%输入：
%%      in:          输入数据(列向量)
%%      rate：       转换率: rate = fo/fi; 输出信号采样率/输入信号采样率
%%      buffer：     缓冲区大小(每次处理的点数)
%%输出：
%%      out：        输出数据(列向量)
%%      realRate：   真实的转换率

if  rate == 1
    out = in;
    realRate = 1;
end

inputLength  = length(in);  %%输入信号长度
inFragLength = bufferSize;  %%输入信号分段长度
fragNum = floor(inputLength/bufferSize)+1;  %%输入信号分段数
in = cat(1,in, zeros(fragNum*inFragLength-inputLength,2)); %%补零
outFragLength = round(bufferSize*rate); %%输出信号分段长度
outputLength = fragNum*outFragLength;   %%输出信号长度
out = zeros(outputLength,1);
realRate = outFragLength/inFragLength;  %%实际转换率
%%采样频率转换
for num = 1:fragNum
    inFrag = in(1+(num-1)*inFragLength:num*inFragLength,:);   %%分段操作
    inFragDCT = dct(inFrag);    %%离散余弦变换
    if  rate > 1
        %%插值操作/升采样
        outFragDCT = cat(1,inFragDCT,zeros(outFragLength-inFragLength,2));
        %%反离散余弦变换+幅度补偿
        outFrag = sqrt(rate)*idct(outFragDCT);
    else
        %%抽取操作/降采样
        outFragDCT = inFragDCT(1:outFragLength,:);
        %%反离散余弦变换+幅度补偿
        outFrag = sqrt(rate)*idct(outFragDCT);
    end
    out(1+(num-1)*outFragLength:num*outFragLength,1:2) = outFrag;
end
