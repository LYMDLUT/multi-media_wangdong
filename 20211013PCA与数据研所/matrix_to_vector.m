function [ vector , longth ] = matrix_to_vector( matrix )

%%function [ vector , longth ] = matrix_to_vector( matrix )
%%矩阵转化为一个列向量;
%%输入参数: 
%%	     matrix 	:	一个矩阵;
%%输出参数: 
%%	     vector	:	转化后的向量;
%%	     longth   :     向量的长度;
%%

matrix_size = size(matrix);
height = matrix_size(1);
width  = matrix_size(2);

longth = height * width;

temp = zeros(height*width,1);
for cl = 0:width-1
    temp(height*cl+1 : height*cl+height) = matrix(:,cl+1);
end    
vector = temp;