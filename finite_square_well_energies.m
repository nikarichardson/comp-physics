% Professor's Modified Code 
% tailored for finite square well solutions
% shows energies in a finite square well, well depth V0, width 2 a
% the intersections of y1 (even) and y3 (odd) with y2 
% give the allowable energies.
clc; clear all; close all;

% colors 
palatinate_purple = 1/255*[104,45,99];
english_lavender = 1/255*[189,139,156];
dark_slate_blue = 1/255*[65,66,136];
old_mauve =  1/255*[112,61,87];
russian_green = 1/255*[92,148,110];
gunmetal = 1/255*[42,45,52];

% initialization
V0 = 17; % well depth in eV
m = 1.0; % in units of electron mass (9.1*10^-34 kg)
a = 0.7; % in units of 10^-9 m or nm
hbar2 = 0.076199682; % hbar squared
E = 0:0.00001:V0;
y1 = tan( a * sqrt( 2 * m * E / hbar2 ) ) ; % tan(k*a) for even wave function 
y3 = - cot( a * sqrt( 2 * m * E / hbar2 ) ) ; % cot(k*a) for odd wave functions
y2 = sqrt( (V0-E)./E ); 
plot(E,y1,'b.', 'MarkerSize',1,'DisplayName','$tan(a sqrt(2*m*E/hbar2 ))$','Color',english_lavender,'interpreter','latex');
xlabel('E in eV' , 'Fontsize',10 ); 
ylabel('tan, cot and sqrt((V0-E)/E)' , 'Fontsize',13);
hold on;
plot(E,y3,'g.', 'MarkerSize',1,'DisplayName','$-cot(a sqrt(2*m*E/hbar2 ))$','Color',dark_slate_blue,'interpreter','latex');
plot(E,y2,'DisplayName','$sqrt((V0-E)/E))$','Color',old_mauve,'interpreter','latex');

% FINDING E_1 intercept of y2 and y1
idx = find(y2 - y1 < eps,1); % get index of intersection 
px = E(idx); 
py = y2(idx);
plot(px,py,'*','MarkerSize',18,'DisplayName','E1 Intersection','Color',palatinate_purple);
hold on; 
first_point = "Intersection (%.4f,%.4f)";
str11 = sprintf(first_point,px,py);
disp(str11)
first_energy = "Energy (Even): %.4f";
str12 = sprintf(first_energy,px);
disp(str12)
disp("-----------------------------") 

% FINDING E_2 intercept of y2 and y3  
idx = find(y2 - y3 < eps, 1); % get index of intersection
px = E(idx);
py = y3(idx);
plot(px,py,'*','MarkerSize',18,'DisplayName','E2 Intersection','Color',palatinate_purple);
second_point = "Intersection: (%.4f,%.4f)";
str21 = sprintf(second_point,px,py); 
disp(str21)
second_energy = "Energy (Odd): %.4f";
str22 = sprintf(second_energy,px);
disp(str22)

axis( [0 V0 -05 17] );
caption = sprintf('Finite Square Well | V_0 = %d eV', V0);
title(caption, 'FontSize', 10);
grid on
legend
set(gca,'FontSize',16)
