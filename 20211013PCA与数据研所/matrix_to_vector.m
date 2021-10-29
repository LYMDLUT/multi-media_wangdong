function [ vector , longth ] = matrix_to_vector( matrix )

%%function [ vector , longth ] = matrix_to_vector( matrix )
%%����ת��Ϊһ��������;
%%�������: 
%%	     matrix 	:	һ������;
%%�������: 
%%	     vector	:	ת���������;
%%	     longth   :     �����ĳ���;
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