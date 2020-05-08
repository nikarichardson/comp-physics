% Lyapunov Exponent
% sensitivity to initial conditions 
% (characterizes rate of separation of infinitesimally 
% close trajectories)  
close all; clear; clc;

% colors 
palatinate_purple = 1/255*[104,45,99];
english_lavender = 1/255*[189,139,156];
dark_slate_blue = 1/255*[65,66,136];

% setup 
N = 1000;
rs = 2.8:0.001:4.0;
 
% ---------------------------------------
% plotting the standard logistic function 
x = getXN(rand(),rs,N);

for n=N-50:N
    % equivalent equation x_n+1 = r*x_n(1-x_n)
    x = rs.* x.* (1-x); 
    plot(rs,x,'.','Color',dark_slate_blue);
    hold on
end

xlim([2.8 4.0]); % r
xlabel("$r$",'interpreter','latex'); 
title("Logistic Map & The Lyapunov Characteristic $X_{n+1} = r*X_{n}(1-X_{n})$",'interpreter','latex');
ylabel("$X_{n}$",'interpreter','latex');
hold off

% ---------------------------------------
% calculating the Lyapunov characteristic
lams = []; 
for r = rs
    xi = getSeq(r,N); 
    dfdx = r.*abs(1-2.*xi); 
    
    % λ_ri
    lam = 1/N * sum(log(dfdx)); 
    lams = [lams, lam]; 
end 

% plotting λ as a function of r 
figure
plot(rs,lams)
xlabel("$r$",'interpreter','latex')
ylabel("$\lambda$",'interpreter','latex')
xlim([2.8 4.0])
yline(0)
title("Lyapunov Characteristic $\lambda = 1/n*sum (ln \mid df(x_i)/dx \mid$",'interpreter','latex') 

% these functions are similar but different 
% one is employed in the logistic graph
% the other is used in the Lyapunov characteristic

% returns the sequence with given parameter and N
function s = getSeq(r,N)
    % initial condition 
    s = rand(); 
    for i = 2:N 
        s(i) = r*s(i-1)*(1 - s(i-1));
    end 
end

% returns the XN with given parameter and N 
function x = getXN(x1,r,N)
    % initial condition 
    x = x1;
    for idx = 2:N 
        % equivalent equation x_n+1 = r*x_n(1-x_n)
        x = r.*x.*(1-x); 
    end 
end