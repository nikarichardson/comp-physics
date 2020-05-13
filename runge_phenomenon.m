% Runge's Phenomenon 
% plots the oscillation at edges of intervals
% due to high degree Lagrangian polynomials
% over equispaced interpolation points
% plots interpolating polynomials of the 5th & 9th order
close all; clear; clc;

% colors--why not!
english_lavender = 1/255*[189,139,156];
dark_slate_blue = 1/255*[65,66,136];
russian_green = 1/255*[92,148,110];
metal = 1/255*[42,45,52];

% setup values
n = 5;
x = @(i) (2.*i)/n - 1; 
i = 0:1:n;
pnts = x(i);
f = @(x) 1./(1+25*x.^2);

% plotting runge's function
F1 = plot(pnts,f(pnts));
hold on;

% --------------------------------------------------------------
% L_5
% k + 1, i.e. 6 values
i = 0:1:5;
x = x(i);
y = f(x);
n = 5;
a = [];

% mark the points for interpolation
for i = 1:1:length(x)
   d(i) = plot(x(i),y(i),'r*','Color',russian_green);
end

z = -1:.1:1;
a = ones(n+1,21);
l = ones(n+1,length(z));
for j = 1:n+1
    for m = 1:n+1
        if m ~= j
            a(m,:) = (z - x(m) ) ./ (x(j)-x(m));
        else
            a(m,:) = 1;
        end
    end

    for k=1:n+1
        l(j,:)=l(j,:).*a(k,:);
    end
       
end
       
L(:) = zeros(1,length(z));

for k=1:length(z)
    for j=1:n+1
        L(k) = L(k) + y(j)*l(j,k);
    end
end

L5 = plot(z,L,'Color',metal);
grid on
hold off;

% finishing the graph 
legend([F1,L5],{'$f = \frac{1}{1+25x^2}$ for $x_i = \frac{2}{n-1}$ on $[0,5]$','$L_5$'},'interpreter','latex');
xlim([-1 1]) 
ylim([-0.1 0.9])
title("Runge's Phenomenon $f = 1/(1+25x^2)$",'interpreter','latex') 
xlabel("$n$",'interpreter','latex')
ylabel("$f$",'interpreter','latex') 
hold off; 

% --------------------------------------------------------------
% L_9  
figure; 

% setup values
n = 9;
x = @(i) (2.*i)/n - 1; 
i = 0:1:n;
pnts = x(i);
f = @(x) 1./(1+25*x.^2);

% plotting runge's function
F2 = plot(pnts,f(pnts));
hold on;

i = 0:1:9;
x = x(i);
y = f(x);
n = 9;
a = [];

% mark the points for interpolation
for i = 1:1:length(x)
   d(i) = plot(x(i),y(i),'r*','Color',dark_slate_blue);
end

z = -1:.1:1;
a=ones(n+1,21);
l=ones(n+1,length(z));
for j = 1:n+1
    for m = 1:n+1
        if m ~= j
            a(m,:) = (z - x(m) ) ./ (x(j)-x(m));
        else
            a(m,:) = 1;
        end
    end

    for k=1:n+1
        l(j,:)=l(j,:).*a(k,:);
    end
       
end
       
L(:) = zeros(1,length(z));

for k=1:length(z)
    for j=1:n+1
        L(k) = L(k) + y(j)*l(j,k);
    end
end

L9 = plot(z,L,'Color',english_lavender);
grid on
legend([F2,L9],{'$f = \frac{1}{1+25x^2}$ for $x_i = \frac{2}{n-1}$ on $[0,9]$','$L_9$'},'interpreter','latex');
xlim([-1 1]) 
ylim([-0.3 0.9])
title("Runge's Phenomenon $f = 1/(1+25x^2)$",'interpreter','latex') 
xlabel("$n$",'interpreter','latex')
ylabel("$f$",'interpreter','latex') 
hold off; 
