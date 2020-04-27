% Max Finder 
% returns the maximum value of a matrix and its index 
close all; clear; clc;

% Test Code 
% Single Row
disp("--------------Single Rows & Cols--------------")
a1 = [1 2 3 4 5 6 7 8 9]
[max_a1,a1_ind] = find_max(a1)
disp("--------------") 
a2 = 1:13
[max_a2,a2_ind] = find_max(a2)
disp("--------------") 
a3 = rand(1,3)
[max_a3,a3_ind] = find_max(a3)
disp("--------------") 
a4 = rand(3,1)
[max_a4,a4_ind]= find_max(a4)


% Multiple Rows 
disp("--------------Multiple Rows & Cols --------------") 
m2 = [1 2 3; 4 5 6; 7 8 9] 
[max_m2,m2_ind] = find_max(m2)
disp("--------------") 
m3 = zeros(3)
[max_m3,m3_ind] = find_max(m3)
disp("--------------") 
m4 = rand(5)
max_m4 = find_max(m4)
disp("--------------") 
m5 = magic(5)
[max_m5,m5_ind] = find_max(m5)
disp("--------------") 
m6 = rand(3,3)
[max_m6,m6_ind] = find_max(m6) 

%{
% Function Definitions 
%} 
function [max,ind] = find_max(x)
    % grab the dimensions 
    dim = size(x); 
    rows=dim(1);
    cols=dim(2);
    % set max to 1st elem
    max=x(1);
    ind=find(x==max); 
    for idx_1=1:rows
        for idx_2=1:cols 
            val=x(idx_1,idx_2);
            if x(idx_1,idx_2)>max
               max=x(idx_1,idx_2);
               ind=[idx_1,idx_2];
            end 
        end 
    end
end