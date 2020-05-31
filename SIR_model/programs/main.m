%% The SIR Model of an Epidemic  
% following the Kermack and McKendrick 1927 Epidemic Model
% as outlined in 4th Edition of Differential Equations 
% (Blanchard, Devaney, Hall 2012. See works cited for details.) 
% Nika Richardson
% Description: 
%   This model seeks to answer the question of how
%   many in a given population will be infected during
%   an active pandemic. We identify three distinct groups:
%       I(t) the infected individuals who can spread the disease
%       S(t) the number of individuals who can catch the disease @ any t 
%       R(t) the individuals who have recovered from disease & attained immunity,
%       including those who passed away from the disease 
close all; clear; clc;

% colors--why not! 
palatinate_purple = 1/255*[104,45,99];
crimson = 1/255*[178,44,77];
russian_green = 1/255*[92,148,110];
pandemic_blue =  1/255*[43,129,179];

%{ Dialog Prompt %}  
dlg_title = 'Parameters for SIR Epidemic Model'; % dialog title
prompt = {'Choose α, the contagion factor (likelihood of population interaction + rate at which disease spreads from interaction)','Choose β, the rate at which infected people recover.'};
num_lines = 1; % number of lines per input slot 
default_input = {'0.2','0.1'}; 
answer = inputdlg( prompt , dlg_title , [1, length(dlg_title)+50], default_input); 
alpha = str2num(answer{1});
beta = str2num(answer{2});

% Assumption I
% St + It + Rt = 1; 

% Assumption II
% The rate that suspectible people and infected people 
% react is ∝ to the number of susceptibles 

% Variables
% α contagion parameter 
% β recovery parameter (rate @ which infected people recover) 
% 
% dS/dt = -αSI
% dI/dt = αSI - βI 
% dR/dt = βI 
% Rt = 1-(S(t) + I(t)) 
% ⇒ 
% System of Equations  
% dS/dt = -αSI
% dI/dt = αSI-βI 

% Equilibria 
% -αSI = 0
% (αS-β)I = 0
% 
% The solution set is the line I = 0
% since no I(t) (no infected people) 
% means no spread of the disease. 
% See included vector field (vector_field.jpg)
% for fixed value of α and β. 
% If αS-β = 0 ⇒  dI/dt = 0
% 
% Equivalently, 
% if S = β/α ⇒ dI/dt = 0
% S = β/α is the threshold value
%       If S > β/α pandemic
%       If S < β/α no pandemic 
% 
% Assumption 3
% The infected individuals recover @ at a rate ∝
% to the number of infected 
% 
% Analytic Description of the Solution Curves
%   dI/dS = (dI/dt)/(dS/dt)
%   = αSI - βI / -αSI
%   = -1 + (β/α) * 1/S
%   I(S) = - S + (β/α)
%   ∫ dI/ds = ∫ [-1 + (β/α) * 1/S] ds
%   I(S) = -S + (β/α) ln(S) + C  
%   with C being a constant of integration
%   0 ≈ I(1) = -S + β/α ln(1) + C = -1 + C.
% Take C = 1. 
%   I (S) =  -S + (β/α) ln(S) + 1

% The larger α is, the more likely everybody (or almost)
% everybody gets infected, that is, the greater the diffuse spread.

% Graphing the solution curves
% I(S) =  -S + (β/α) ln(S) + 1
I = @(S) -S + (beta/alpha)*log(S) + 1; 
l = linspace(0.5,3); 
hold on; 
yline(0) 
title("Approximation of the Solution Curve for $I(t)$ in the SIR Model",'interpreter','latex')
plot(l,I(l),'Color',pandemic_blue,'LineWidth',1.5)

xlabel("$S(t)$",'interpreter','latex')
ylabel("$I(t)$",'interpreter','latex')

figure; 
set(gcf, 'Position', get(0, 'Screensize'));

% Euler's Method 
% using 3 x3 system to calculate Euler's method 
% initial conditions
% a few infected people with a completely susceptible population 
s0 = 0.99; 
r0 = 0;
i0 = 0.01; 
a = 0; 
b = 250;

% time steps 
N = 1000;
h = (b-a)/N; 
s(1) = s0;
r(1) = r0; 
i(1) = i0;
t(1) = 0;

for n=1:N 
    s(n+1) = s(n) - alpha*s(n)*i(n)*h;
    i(n+1) = i(n) + (alpha*s(n)*i(n)-beta*i(n))*h; 
    r(n+1) = r(n) + beta*i(n)*h; 
    t(n+1) = t(n) + h; 
end
hold on;

plot(t,s,'Color',pandemic_blue,'LineWidth',1.5,'DisplayName','$s(t)$ fraction of population of susceptible individuals')
plot(t,i,'Color',crimson,'LineWidth',1.5,'DisplayName','$i(t)$ fraction of population of infected individuals');
hold on; 
plot(t,r,'Color',russian_green,'LineWidth',1.5,'DisplayName','$r(t)$ fraction of population of recovered individuals'); 
hold off; 
title("The SIR Model of an Epidemic",'interpreter','latex','FontSize',16)
legend('Interpreter','latex','FontSize',16)
xlabel("$t$ (days)",'interpreter','latex','FontSize',16)
ylabel("I(t), S(t), R(t)",'interpreter','latex','FontSize',16) 