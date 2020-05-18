% Approximations of the Derivatives 
% plots the forward, backward,
% and central approximations of the
% derivative of f(x) = 1000exp(x/17) at 
% x=3.2 for h=0.01 to 5 in steps of 0.05 
close all; clear; clc;

set(gcf, 'Position', get(0, 'Screensize'));

% anonymous function 
f = @(x) 1000.*exp(x/17); 

% df = @(x) 3/17.*1000.*exp(x).*log(10); 

% colors--why not! 
english_lavender = 1/255*[189,139,156];
dark_slate_blue = 1/255*[65,66,136];
russian_green = 1/255*[92,148,110];
metal = 1/255*[42,45,52];
apricot = 1/255*[250,201,84];
dark_slate_purple = 1/255*[65,51,122];

x = 3.2; 
h = 0.01:0.05:5; 
i = 1;

% plot fd as a function of h
subplot(3,1,1)
fd = @(k) f(x+k)-f(x)./(k); 
plot(h,fd(h),'Color',english_lavender,'LineWidth',1.5)
xlabel('$h$','interpreter','latex')
ylabel('Forward Difference $fd = \frac{f(x+m)-f(x)}{m}$','interpreter','latex') 
title('Forward Difference Derivative Approximation for $f=1000^{(x/17)}$','interpreter','latex')

% plot cd as a function of h 
subplot(3,1,2)
cd = @(k) f(x+k)-f(x-k)./(2.*k); 
plot(h,cd(h),'Color',dark_slate_blue,'LineWidth',1.5)
xlabel('$h$','interpreter','latex')
ylabel('Central Difference $\frac{f(x) - f(x-h)}{h}$','interpreter','latex') 
title('Central Difference Derivative Approximation for $f=1000^{(x/17)}$','interpreter','latex')

% plot bd as a function of h
subplot(3,1,3)
bd = @(k) f(x) - f(x-k)./(k);
plot(h,bd(h),'Color',apricot,'LineWidth',1.5)
xlabel('$h$','interpreter','latex')
ylabel('Backward Difference $cd = \frac{f(x+h)-f(x-h)}{(2*h)}$','interpreter','latex') 
title('Backward Difference Derivative Approximation for $f=1000^{(x/17)}$','interpreter','latex')
