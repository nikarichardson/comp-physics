% Airy Pattern I
% calculates the airy pattern (airy disk), which describes
% the best focused spot of light that a perfect lens
% with perfect aperture can make
% also calculates the airy pattern for 11 discrete values 
close all; clear; clc;

% colors--why not! 
palatinate_purple = 1/255*[104,45,99];
english_lavender = 1/255*[189,139,156];

I0 = 1; 
I = @(x) I0 * ((2.*besselj(1,x)) / x).^2; 
t = linspace(0,10,100);  

mat = []; 
for rh = linspace(0,10,100);
    mat = [mat,I(rh)/I0]; 
end

plot(t,mat,'Color',palatinate_purple,'LineWidth',1.5)
xlabel("$\rho = kasin\theta$",'interpreter','latex')
ylabel("$I(t)/I_0$",'interpreter','latex') 
title("The Airy Pattern $I(t)= I_0 * [2J(\rho)/\rho]^2$",'interpreter','latex')

figure;

I0 = 1; 
t = [0,1,2,3,4,5,6,7,8,9,10]; 

mat = []; 
for rh = t;
    mat = [mat,I(rh)/I0]; 
end

plot(t,mat,'Color',english_lavender,'LineWidth',1.5)
xlabel("$\rho = kasin\theta$",'interpreter','latex')
ylabel("$I(t)/I_0$",'interpreter','latex') 
xlim([0.99 10])
title("The Airy Pattern With 11 Data Points",'interpreter','latex')