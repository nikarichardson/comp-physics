%% The SIR Model of an Epidemic :: Case Examples  
% Case Examples 
% Nika Richardson
%       I(t) the infected individuals who can spread the disease
%       S(t) the number of individuals who can catch the disease @ any t 
%       R(t) the individuals who have recovered from disease & attained immunity,
%       including those who passed away from the disease 
close all; clear; clc;

% dS/dt = -αSI
% dI/dt = αSI - βI 
% dR/dt = βI 

% colors--why not! 
palatinate_purple = 1/255*[104,45,99];
crimson = 1/255*[178,44,77];
russian_green = 1/255*[92,148,110];
pandemic_blue =  1/255*[43,129,179];

% Coronavirus in South Korea
% Population: 51,470,000
% average values of α =  0.1656
% average of β  = 0.0253
% from February 27th-March 30th (33 days)
% taken from study cited in works cited
% (parameters in original study have
% different names) 
alpha = 0.1656;
beta = 0.0253; 

subplot(2,1,1); 
set(gcf, 'Position', get(0, 'Screensize'));

% Euler's Method 
% using 3 x 3 system to calculate Euler's method 
% we did not alter initial conditions from main.m for this case example
% a few infected people with a completely susceptible population 
s0 = 0.99; 
r0 = 0;
i0 = 0.01; 
a = 0; 
b = 33;

% time steps 
N = 1000;
h = (b-a)/N; 
s(1) = s0;
r(1) = r0; 
i(1) = i0;
t(1) = 0;
z = 0; 
for n=1:N 
    s(n+1) = s(n) - alpha*s(n)*i(n)*h;
    i(n+1) = i(n) + (alpha*s(n)*i(n)-beta*i(n))*h; 
    r(n+1) = r(n) + beta*i(n)*h; 
    t(n+1) = t(n) + h; 
end

hold on;
xlim([0 33])
plot(t,s,'Color',pandemic_blue,'LineWidth',1.5,'DisplayName','$s(t)$ fraction of population of susceptible individuals')
plot(t,i,'Color',crimson,'LineWidth',1.5,'DisplayName','$i(t)$ fraction of population of infected individuals');
hold on; 
plot(t,r,'Color',russian_green,'LineWidth',1.5,'DisplayName','$r(t)$ fraction of population of recovered individuals'); 
hold off; 
title("SIR Model for COVID-19 in South Korea (February 27th, 2020- March 30th,2020; 33 days)",'interpreter','latex','FontSize',16)
legend('Interpreter','latex','FontSize',16)
xlabel("$t$ (days)",'interpreter','latex','FontSize',16)
ylabel("I(t), S(t), R(t)",'interpreter','latex','FontSize',16) 

subplot(2,1,2);
% EVD (Ebola) in Liberia
% (see works cited for original paper)
% α = 0.80
% β = 0.50
alpha = 0.80; 
beta = 0.50; 

% Euler's Method 
% using 3 x3 system to calculate Euler's method 
% we did not alter initial conditions from main.m for this case example
% a few infected people with a completely susceptible population 
s0 = 0.80; 
i0 = 0.20; 
r0 = 0;
a = 0; 
b = 60;

% time steps 
N = 1000;
h = (b-a)/N; 
s(1) = s0;
r(1) = r0; 
i(1) = i0;
t(1) = 0;
z = 0; 
for n=1:N 
    s(n+1) = s(n) - alpha*s(n)*i(n)*h;
    i(n+1) = i(n) + (alpha*s(n)*i(n)-beta*i(n))*h; 
    r(n+1) = r(n) + beta*i(n)*h; 
    t(n+1) = t(n) + h; 
end

hold on;
xlim([0 60])
plot(t,s,'Color',pandemic_blue,'LineWidth',1.5,'DisplayName','$s(t)$ fraction of population of susceptible individuals')
plot(t,i,'Color',crimson,'LineWidth',1.5,'DisplayName','$i(t)$ fraction of population of infected individuals');
hold on; 
plot(t,r,'Color',russian_green,'LineWidth',1.5,'DisplayName','$r(t)$ fraction of population of recovered individuals'); 
hold off; 
title("SIR Model for EVD in Liberia (August 29, 2014 - October 28, 2014; 60 days)",'interpreter','latex','FontSize',16)
legend('Interpreter','latex','FontSize',16)
xlabel("$t$ (days)",'interpreter','latex','FontSize',16)
ylabel("I(t), S(t), R(t)",'interpreter','latex','FontSize',16) 