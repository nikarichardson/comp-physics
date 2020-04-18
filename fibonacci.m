% fibonacci sequence & golden rule 
% computes the fibonacci sequence up to n terms 
% plots convergence to the golden ratio 
close all; clear; clc;

prompt = { ' Enter the number of terms, N: '};
dlg_title = 'Input a number of terms for the sequence or accept the default. '; % dialog title 
num_lines = 1; % lines for each input slot
default_input = { '14'}; 
answer = inputdlg( prompt , dlg_title , num_lines , default_input );
n = str2num( answer{ 1 } ) % convert string to a number

% set up variables 
n1 = 1;
n2 = 1;
count = 0;
arr = [];                   % array will hold fib seq 

if n == 1
    arr = n1
else
    while count < n
        arr = [arr, n1]; 
        next = n1+n2;
        n1=n2;
        n2=next;
        count = count + 1;
    end 
end 

fib_sequence = arr 

% build the ratios
ratios = zeros(1,length(arr)); % pre-fill arr
fn1 = []; % f(n)-1
fn = [];  % f(n) 
inc=1; % index for ratios array
iter=0; 

% f(n)/f(n)-1 
for ind = 3:length(arr)-2
    fn = [fn,arr(ind-1)];
    fn1 =[ fn1, arr(ind)];
	result = vpa(arr(ind),10)/vpa(arr(ind-1),10); 
    ratios(inc) = result; 
    inc=inc+1;
    iter=iter+1; 
end

final_ratios=vpa(nonzeros(ratios),10); 
fprintf("%d digits in Fibonacci sequence.\n",n)
fprintf("%d iterations.\n",iter)
plot(fn,final_ratios,'-.ok')
hold on
yline(1.61803398874,'-b','\phi','Linewidth',1.2)
xlim([0 fn(length(fn))])
title("Ratio of Successive Terms of Fibonacci Sequence Converge to \phi")
legend('f(n)/f(n-1)','\phi')
xlabel("f(n): nth Fibonacci Sequence") 
ylabel("f(n)/f(n-1)")