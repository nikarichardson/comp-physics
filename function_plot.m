% Plotting Function
% plots a function 
close all; clear; clc;
t = [0:2:10] 
prompt = { ' Enter constant A: ',' Enter constant B: ' , ' Enter constant C:'};
dlg_title = 'Input numbers please, or accept the defaults provided for you '; % dialog title 
num_lines = 1; % lines for each input slot
default_input = { '12' , '35', '26' }; 
answer = inputdlg( prompt , dlg_title , num_lines , default_input );
A = str2num( answer{ 1 } ) % convert string to a number
B = str2num( answer{ 2 } ) 
C = str2num( answer{ 3 } ) 

% Method 1 
disp("--------------Method 1")
y = A.*t.^(3/2)+B.*t+C

plot(t,y)
title('Method 1: Solutions of $At^{3/2}+Bt+C For T=0:2:10$','interpreter','latex')
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
title('Method 2: Solutions of $At^{3/2}+Bt+C For T=0:2:10$','interpreter','latex')
xlabel( 't' );
ylabel( 'output ' );