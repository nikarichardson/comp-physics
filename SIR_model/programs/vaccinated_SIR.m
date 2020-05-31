%% The SIR Model of an Epidemic With Partly Vaccinated Population 
% We alter the SIR model to incorporate the assumption
% that a percentage of the population is vaccinated. 
% Given beta and alpha from the user, we consider an initial 
% condition of S(0) =  beta/alpha
% which will prevent the epidemic. S(0) = beta/alpha
% says that a given portion of the population is vaccinated.
% Nika Richardson
close all; clear; clc;

% colors--why not! 
palatinate_purple = 1/255*[104,45,99];
crimson = 1/255*[178,44,77];
russian_green = 1/255*[92,148,110];
pandemic_blue =  1/255*[43,129,179];

% What percentage of the population
% must be vaccinated to prevent the epidemic?
%
% 0 <= S(0) <= β/α 
%   since dI/dt < 0 
%   ⇒ αSI - βI < 0 
%   ⇒ aS - β < 0  if I > 0 
%   hence, S <= β/α ⇒ dI/dt < 0 

%{ Dialog Prompt %}  
dlg_title = 'Parameters for SIR Epidemic Model'; % dialog title
prompt = {'Choose α, the contagion factor (likelihood of population interaction + rate at which disease spreads from interaction)','Choose β, the rate at which infected people recover.'};
num_lines = 1; % number of lines per input slot 
default_input = {'0.25','0.1'}; 
answer = inputdlg( prompt , dlg_title , [1, length(dlg_title)+50], default_input); 
alpha = str2num(answer{1});
beta = str2num(answer{2});
percent_vaccinated = 100-round(beta/alpha*100); % 1 - β/α
str2 = sprintf("For the given values of α and β, we must have %d%% \nof the population vaccinated to avoid a pandemic.",percent_vaccinated);  
disp(str2)

figure; 
set(gcf, 'Position', get(0, 'Screensize'));

% Euler's Method 
% using 3 x 3 system to calculate Euler's method 
% Initial Conditions
% we let S(0) = β/α 
s0 = beta/alpha; 
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
str1=sprintf('S(0) = β/α = %f',beta/alpha);
text(5.25,0.3622,str1,'interpreter','latex'); 
str2=sprintf("%d%% of the population must be vaccinated",percent_vaccinated); 
text(5.25,0.3522,str2,'interpreter','latex'); 
title("The SIR Model of an Epidemic With Partly Vaccinated Population",'interpreter','latex','FontSize',16)
legend('Interpreter','latex','FontSize',16)
xlabel("$t$ (days)",'interpreter','latex','FontSize',16)
ylabel("I(t), S(t), R(t)",'interpreter','latex','FontSize',16) 
hold off; 