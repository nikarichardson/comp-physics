% max finder 
% returns the maximum value of a matrix  
close all; clear; clc;

% Test Code 
% --Single Row
disp("-------Single Rows & Cols -------") 
a1 = [1 2 3 4 5 6 7 8 9]
max_a1=find_max(a1)
a2 = 1:13
max_a2=find_max(a2)
a3=rand(1,3)
max_a3=find_max(a3)
a4=rand(3,1)
max_a3=find_max(a4)


% --Multiple Rows 
disp("-------Multiple Rows & Cols -------") 
m2 = [1 2 3; 4 5 6; 7 8 9] 
max_m2=find_max(m2)
m3=zeros(3)
max_m3=find_max(m3)
m4=rand(5)
max_m4=find_max(m4)
m5=magic(5)
max_m5=find_max(m5)
m6=rand(3,3)
max_m6=find_max(m6)


function max = find_max(x)
    % grab the dimensions 
    dim = size(x); 
    rows=dim(1);
    cols=dim(2);
    % set max to 1st elem
    max=x(1);  
    for idx_1=1:rows
        for idx_2=1:cols 
            val=x(idx_1,idx_2);
            if x(idx_1,idx_2)>max
               max=x(idx_1,idx_2);  
            end 
        end 
    end
end