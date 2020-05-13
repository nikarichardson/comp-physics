% Solutions to the Square Well 
% plots the lowest solutions to the square well
% potential and wave functions 
close all; clear; clc;

% Plot the potential and the wave functions of these solutions
% Pick one unknown value, for instance, D to be equal to 1
a = 0.7;        % units: nm
m = 1.0;        % units: e_m (mass of an electron)
V0 = 17;        % units: ev 

% see schrodinger.m (modified) for calculations  
E1 = 0.1683; % EVEN 
E2 = 0.6727; % ODD 

% colors--why not! 
palatinate_purple = 1/255*[104,45,99];
english_lavender = 1/255*[189,139,156];
platinum = 1/255*[232,233,233];
dark_slate_blue = 1/255*[65,66,136];
old_mauve =  1/255*[112,61,87];
russian_green = 1/255*[92,148,110];
metal = 1/255*[42,45,52];

% initialization
hbar2 = 0.076199682; % m_e Ev nm^2 
k1 = sqrt(2*m*E1/hbar2); 
k2 = sqrt(2*m*E2/hbar2); 
mu1 = sqrt(2*m*(V0-E1)/hbar2); 
mu2 = sqrt(2*m*(V0-E2)/hbar2);  

% create the intervals for each region 
xl = linspace(-2*a,-a,1e4); 
xm = linspace(-a,a,1e4); 
xr = linspace(a,2*a,1e4); 

% setup 
set(gcf,'OuterPosition', get(0,'Screensize') );
disp("Wave Function for Finite Square Well Ψ"); 

% Unknowns 
B = 1; 
A1 = 1;
A2 = -.5;

% Boundary Conditions
D1 = cos(k1*a)/exp(-mu1*a);
D2 = (cos(k1*a)/exp(-mu2*a));

% EVEN E1 (1st)
psi1l = D1*exp(mu1*(xl)); 
psi1m = A1*cos(k1*xm); 
psi1r = D1*exp(-mu1*(xr)); % D1 = F 

% ODD E2 (2nd) 
psi2l = D2*exp(mu2*(xl));
psi2m = A2*sin(k2*xm);
psi2r = -D2*exp(-mu2*(xr)); % D2 = F 

hold on 
% Plotting Ψ as a Function of Position in the Well 
p1(1) = plot(xl,psi1l,'Color',palatinate_purple,'LineWidth',1.5);
p1(2) = plot(xm,psi1m,'Color',palatinate_purple,'LineWidth',1.5);
p1(3) = plot(xr,psi1r,'Color',palatinate_purple,'LineWidth',1.5);
ylabel("Wavefunction $\psi$",'interpreter','latex');
title("Lowest Energy Solutions to the Finite Square Well Problem",'interpreter','latex');
xlabel("Position ($x$)",'interpreter','latex');
xline(a,'LineWidth',2,'Color',metal); 
xline(-a,'LineWidth',2,'Color',metal); 
ylim([-1.5 1.5])
xlim([-1.3 1.3]) 
set(gca,'FontSize',16)
p2(1) = plot(xl,psi2l,'Color',english_lavender,'LineWidth',1.5);
p2(2) = plot(xm,psi2m,'Color',english_lavender,'LineWidth',1.5);
p2(3) = plot(xr,psi2r,'Color',english_lavender,'LineWidth',1.5);
legend([p1(1), p2(1)], {'$E_1$ = 0.1683', '$E_2$ = 0.6727'},'interpreter','latex') 

%{
% Graphing the Potential 
% Potential for E1
%} 

en1 = E1; 
mat = [xl, xm, xr]; 
mat2 = [];
i = 0;
lin = -2*a:0.0001:2*a; 
for n=-2*a:0.0001:2*a 
    i = i + 1; 
    if mat(i) < -a % left region -2*a to (-a) 
        mat2 = [mat2,V0]; 
    elseif mat(i) >= -a & mat(i) <= a % middle region -a to a 
        mat2 = [mat2,en1];
    else  % right region 
        mat2 = [mat2,V0];        
    end
end

figure
subplot(2,1,1);
yline(E1,'-.','LineWidth',1,'Color',english_lavender)
hold on; 
plot(lin,mat2,'Color',metal);
text(1.3/2,E1+1.3,'$E_1$ = 0.6964','interpreter','latex') %E1 = 0.1920; 
xlim([-1.3 1.3]) 
ylim([-3 20])
title("Potential Graph for a Solution to Finite Square Well Problem ($E_1$)",'interpreter','latex') 
xlabel("Position ($x$)",'interpreter','latex')
ylabel("Energy ($eV$)",'interpreter','latex') 

% Potential for E2
en2 = E2; 
mat = [xl, xm, xr]; 
mat2 = [];
i = 0;
lin = -2*a:0.0001:2*a; 
for n=-2*a:0.0001:2*a 
    i = i + 1; 
    if mat(i) < -a % left region -2*a to (-a) 
        mat2 = [mat2,V0]; 
    elseif mat(i) >= -a & mat(i) <= a % middle region -a to a
        mat2 = [mat2,en2];
    else  % right region a to 2*a 
        mat2 = [mat2,V0];        
    end
end

subplot(2,1,2);
yline(E2,'-.','LineWidth',1,'Color',english_lavender)
hold on; 
plot(lin,mat2,'Color',metal);
lp = linspace(-2*a,-a,10^4);
rp = linspace(-3,20,10^4);
hold on;
text(1.3/2,E2+1.3,'$E_2$ = 0.6964','interpreter','latex') 
xlim([-1.3 1.3]) 
ylim([-3 20])
title("Potential Graph for a Solution to Finite Square Well Problem (E2)",'interpreter','latex') 
xlabel("Position ($x$)",'interpreter','latex')
ylabel("Energy ($eV$)",'interpreter','latex') 

