% Logistic Map  
% calculates sequence for given parameter of r
% & plots sequence as a function of the parameter
close all; clear; clc;

% initial condition 
x1 = rand();

% ------------------------------------
% Discrete X_n Value Calculations 
% calculate sequence for r=2.99 
xn_299 = getXN(2.99,100) 

% calculate sequence for r=3.05 
xn_305 = getXN(3.05,100) 

% calculate sequence for r=3.54
xn_354 = getXN(3.54,100) 

% calculate sequence for r=3.6 
xn_360 = getXN(3.60,100) 

r = 2.99:0.0001:3.6; 
N = 100;

x=getXN(r,N);

% ------------------------------------
% Plotting Without Transient Values  
% continuously plot n values
% plot once the transients have died down
for n=50:N
    % equivalent equation x_n+1 = r*x_n(1-x_n)
    x = r.* x.* (1-x); 
    xlim([3 3.6]);
    plot(r,x,'k.','MarkerSize',.1);
    xlabel("r"); 
    title("Logistic Map x_{n+1} = r*x_{n}(1-x_{n})");
    ylabel("x_{n}");
    hold on
end

hold off

% returns the sequence with given parameter and N 
function x = getXN(r,N)
    % initial condition 
    x = rand(); 
    for idx = 2:100 
        % equivalent equation x_n+1 = r*x_n(1-x_n)
        x = r.*x.*(1-x); 
    end 
end