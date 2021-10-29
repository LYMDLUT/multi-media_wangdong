
fileName = 'audio48kHz';
bufferSize = 2205;
RATE = [ 2^(2/12) 2^(1/12) 2^(0/12) 2^(-1/12) 2^(-2/12) ];
PITCH = cell(1,5);
PITCH{1} = '-2'; PITCH{2} = '-1'; PITCH{3} = '0'; PITCH{4} = '+1'; PITCH{5} = '+2'; 
[ data fs  ] = audioread([ fileName '.wav' ]);
% for num = 1:size(RATE,2)
%     rate = RATE(num);
%     [ dataPitch realRate ] = src_dct(data, rate, bufferSize);
%     audiowrite([ fileName  PITCH{num} '.wav' ],dataPitch, fs);
% end
[ dataPitch realRate ] = src_dct(data,1.0884, bufferSize);
audiowrite('new.wav' ,dataPitch./max(dataPitch), 48000);