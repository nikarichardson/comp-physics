% Integration I
% integrates sin function using trapezoid,
% Simpson's, and Simpson's 3/8 rules 
close all; clear; clc;

N = 16:1024;  
three = 3.*N; 
N = 16:three:1024; 

% colors--why not! 
english_lavender = 1/255*[189,139,156];
dark_slate_blue = 1/255*[65,66,136];
russian_green = 1/255*[92,148,110];
metal = 1/255*[42,45,52];
palatinate_purple = 1/255*[104,45,99];

% trapezoidal rule
j = 1; 
figure
for i=16:three:1024 
    x = linspace(0,pi,i);
    dx = x(2) - x(1);
    f_x = sin(x);
    trapt(j) = (sum(f_x) - (f_x(1) + f_x(end))/2)*dx;  
    j = j+1;  
    hold on; 
end 

plot(N,trapt,'Color',dark_slate_blue,'LineWidth',1)
ylabel('$\approx \int sinx$','interpreter','latex')
title("Trapezoid Rule for $sinx [0,pi]$",'interpreter','latex') 
xlabel('$N$','interpreter','latex') 
ylim([1.993 2.00009])

% check the answer
% trapz(x,f_x); 
hold on; 
answer = trapz(x,f_x); 
yline(answer,'Color',russian_green,'LineWidth',1) 
figure
text(2,1.996,'$\int sin x $ = 2.00','interpreter','latex')  
% unmute:
plot(N,trapz(x,f_x),'Color',dark_slate_blue) 


% Simpson's Rule 
% integral calculation 
a = 0;
b = pi;
j = 1; 
N = 16:1024;
n = 16;

while n < 1024 
    h = (b-a)/n; 
    f = @(x) sin(x);
    x = linspace(a,b,n);
    
    for k = 2:n/2
        S(k) = f(x(2*k-2))+4*f(x(2*k-1))+f(x(2*k)); 
    end
    
    simpson(j) = (h/3)*sum(S);  
    j = j+1; 
    n = 3*n; 
end
 
simpson; 
line = 1:j-1; 
plot(line,simpson,'Color',english_lavender,'LineWidth',1)
ylabel('$\approx \int sinx$','interpreter','latex')
title("Simpson's Rule for $sinx [0,pi]$",'interpreter','latex') 
xlabel('Iterations','interpreter','latex') 
yline(2,'Color',russian_green,'LineWidth',1) 
hold on; 
ylim([1.85 2.005])
text(2,1.996,'$\int sin x $ = 2.00','interpreter','latex')  

figure;
% Simpson's 3/8th Rule 
% integral calculation 
a = 0;
b = pi;
j = 1; 
N = 16:1024;
n = 16;

while n < 1024 
    h = (b-a)/n; 
    f = @(x) sin(x);
    x = linspace(a,b,n);
    
    R(1) =  f(x(1)); 
    R(2) = 3*f(x(2));  
    k = 4;
    
    while k < n-1
        R(k) = 3*f(x(k)); 
        k = k + 1; 
    end
    
    q = 3;
    while q < n-3
        R(q) = 2*f(x(q)); 
        q = q + 3 ; 
    end
    
    R(n) = f(x(n)); 
    simpson(j) = (3*h/8)*sum(R); 
    j = j+1; 
    n = 3*n;  
end

line = 1:j-1; 
plot(line,simpson,'Color',palatinate_purple,'LineWidth',1)
ylabel('$\approx \int sinx$','interpreter','latex')
title("Simpson's $\frac{3}{8}$ Rule for $sinx [0,pi]$",'interpreter','latex') 
xlabel('Iterations','interpreter','latex') 
yline(2,'Color',russian_green,'LineWidth',1) 
hold on; 
ylim([1.85 2.005])
xlim([1 4])
text(2,1.996,'$\int sin x $ = 2.00','interpreter','latex')  

