function [ out realRate ] = src_dct(in, rate, bufferSize)
%%������ɢ���ұ任(DCT)ʵ�ֲ���Ƶ��ת��(Sample Rate Conversion)
%%���룺
%%      in:          ��������(������)
%%      rate��       ת����: rate = fo/fi; ����źŲ�����/�����źŲ�����
%%      buffer��     ��������С(ÿ�δ���ĵ���)
%%�����
%%      out��        �������(������)
%%      realRate��   ��ʵ��ת����

if  rate == 1
    out = in;
    realRate = 1;
end

inputLength  = length(in);  %%�����źų���
inFragLength = bufferSize;  %%�����źŷֶγ���
fragNum = floor(inputLength/bufferSize)+1;  %%�����źŷֶ���
in = cat(1,in, zeros(fragNum*inFragLength-inputLength,2)); %%����
outFragLength = round(bufferSize*rate); %%����źŷֶγ���
outputLength = fragNum*outFragLength;   %%����źų���
out = zeros(outputLength,1);
realRate = outFragLength/inFragLength;  %%ʵ��ת����
%%����Ƶ��ת��
for num = 1:fragNum
    inFrag = in(1+(num-1)*inFragLength:num*inFragLength,:);   %%�ֶβ���
    inFragDCT = dct(inFrag);    %%��ɢ���ұ任
    if  rate > 1
        %%��ֵ����/������
        outFragDCT = cat(1,inFragDCT,zeros(outFragLength-inFragLength,2));
        %%����ɢ���ұ任+���Ȳ���
        outFrag = sqrt(rate)*idct(outFragDCT);
    else
        %%��ȡ����/������
        outFragDCT = inFragDCT(1:outFragLength,:);
        %%����ɢ���ұ任+���Ȳ���
        outFrag = sqrt(rate)*idct(outFragDCT);
    end
    out(1+(num-1)*outFragLength:num*outFragLength,1:2) = outFrag;
end
