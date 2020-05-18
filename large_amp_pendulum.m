% Integration II/Pendulum II
% plots the period of the large amplitude pendulum 
% as a function of the amplitude 
close all; clear; clc;
% set(gcf, 'Position', get(0, 'Screensize'));

% colors--why not! 
english_lavender = 1/255*[189,139,156];
russian_green = 1/255*[92,148,110];
metal = 1/255*[42,45,52];
dark_slate_purple = 1/255*[65,51,122]; 
royal_blue = 1/255*[0,36,65]; 
apricot = 1/255*[250,201,84];
palatinate_purple = 1/255*[104,45,99];

% theta = amplitude
M = 0.5; 
% length
l = 1; % m
% acceleration due to gravity 
g = 1; % m/s^2
% calculate K with ellipke :) 
T = @(theta) 4.*sqrt(l/g).*ellipke(sin(theta/2)); 
x = linspace(0,2*pi);
plot(x,T(x),'Color',palatinate_purple); 
xlim([0 6]); 
title("Period as a Function of Large Amplitude",'interpreter','latex')
ylabel('$\theta$','interpreter','latex')
xlabel('$T = 4*\sqrt{l/g}*K(sin(\theta/2))$','interpreter','latex'); 
figure; 
plot(0:.01:1,ellipke(0:.01:1),'Color',russian_green); 
title("The Elliptic Integral of the First Kind",'interpreter','latex') 
ylabel("$K(k)$",'interpreter','latex')
xlabel("$k$",'interpreter','latex') 
xlim([0 .9])