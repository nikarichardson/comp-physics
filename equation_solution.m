% plots a function 
close all; clear; clc;
t = [0:2:10] 

A = input( 'Enter constant (A): ' );
B = input( 'Enter constant (B): ' );
C = input( 'Enter constant (C): ' );

% Method 1 
disp("--------------Method 1")
y = A.*t.^(3/2)+B.*t+C

plot(t,y)
title('Method 1: Solutions of At^{3/2}+Bt+C For T=0:2:10')
xlabel( 't' );
ylabel( 'output ' );

% Method 2 
% initialize with empty zero array
arr = zeros(1,5);
% run for loop and evaluate for each val
disp("--------------Method 2") 
for idx=1:length(t)
    num=t(idx);
	result = (A*num^(3/2)) + (B*num) + C;
    arr(idx) = result; 
end
arr

figure
plot(t,arr)
title('Method 2: Solutions of At^{3/2}+Bt+C For T=0:2:10')
xlabel( 't' );
ylabel( 'output ' );