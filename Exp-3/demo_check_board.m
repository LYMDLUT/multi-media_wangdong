function demo_check_board

blockSize  = [16, 16]; 
boardSize = [4, 5]; 
zeroBlock   = zeros(blockSize(1), blockSize(2)); 
oneBlock    = ones(blockSize(1), blockSize(2));  
basicBlock   = [zeroBlock, oneBlock; oneBlock, zeroBlock];
checkBoard = repmat(basicBlock, [boardSize(1), boardSize(2)]);
figure(1),imshow(checkBoard);
%
boardSize = size(checkBoard);
boardLine  = reshape(checkBoard, [boardSize(1)*boardSize(2) 1]);
figure(2),plot(boardLine);
%
