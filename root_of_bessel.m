% Finding the Root of the Bessel Function 
close all; clear; clc;
set(gcf, 'Position', get(0, 'Screensize'));

% colors--why not! 
english_lavender = 1/255*[189,139,156];
russian_green = 1/255*[92,148,110];
metal = 1/255*[42,45,52];
dark_slate_purple = 1/255*[65,51,122]; 
royal_blue = 1/255*[0,36,65]; 
apricot = 1/255*[250,201,84];

% plot the bessel function 
B = plot(0:.1:5,besselj(1,0:.1:5));
grid on;
yline(0); 
hold on; 
l1=0:.1:5; 
xlabel("$z$",'interpreter','latex','Fontsize',18);
ylabel("$J_1(z)$",'interpreter','latex','Fontsize',18);

% plotting data points A for interpolation
dA(1) = plot(3.6,0.09547,'r*','Color',metal);
dA(2) = plot(3.7,0.05383,'r*','Color',metal);
dA(3) = plot(3.8,0.01282,'r*','Color',metal);
dA(4) = plot(3.9,-0.02724,'r*','Color',metal);

% setting up values for cubic interpolation
x0 = 3.6;
x1 = 3.7;
x2 = 3.8;
x3 = 3.9;
y0 = 0.0957;
y1 = 0.05383;
y2 = 0.01282;
y3 = -0.02724; 
d1 = (x0 - x1) .* (x0-x2) .* (x0-x3); 
d2 = (x1-x0) .* (x1-x2) .* (x1-x3); 
d3 = (x2-x0) .* (x2-x1) .* (x2-x3); 
d4 = (x3-x0) .* (x3-x1) .* (x3-x2); 
P3 = @(x) y0.* ((x-x1).*(x-x2).*(x-x3))/d1 + y1 .* ((x-x0).*(x-x2).*(x-x3))/d2 + y2 .* ((x-x0).*(x-x1).*(x-x3))/d3 + y3 .* ((x-x0).*(x-x1).*(x-x2))/d4;
L3 = plot(l1,P3(l1),'Color',russian_green);
hold on;  
r = plot(3.8317,0,'diamond','Color',royal_blue);
yline(0,'LineWidth',1.5,'Color',english_lavender);
ylim([-0.5 0.4]); 
xlim([3.59 3.91]);

% Second Cubic Interpolation
l2 = linspace(3.7,3.9,4); 
x0 = 3.700;
x1 = 3.766;
x2 = 3.833;
x3 = 3.900;
y0 = 0.0538;
y1 = 0.0267;
y2 = -5.0923e-04;
y3 = -0.0272; 
approx = [x2]; 

% plotting data points B for interpolation
dB(1) = plot(3.700,0.0538,'.','Color',dark_slate_purple,'MarkerSize',12);
dB(2) = plot(3.766,0.0267,'.','Color',dark_slate_purple,'MarkerSize',12);
dB(3) = plot(3.833,-5.0923e-04,'.','Color',dark_slate_purple,'MarkerSize',12);
dB(4) = plot(3.9,-0.0272,'.','Color',dark_slate_purple,'MarkerSize',12); 
d1 = (x0 - x1) .* (x0-x2) .* (x0-x3); 
d2 = (x1-x0) .* (x1-x2) .* (x1-x3); 
d3 = (x2-x0) .* (x2-x1) .* (x2-x3); 
d4 = (x3-x0) .* (x3-x1) .* (x3-x2); 
P4 = @(x) y0.* ((x-x1).*(x-x2).*(x-x3))/d1 + y1 .* ((x-x0).*(x-x2).*(x-x3))/d2 + y2 .* ((x-x0).*(x-x1).*(x-x3))/d3 + y3 .* ((x-x0).*(x-x1).*(x-x2))/d4;
L4 = plot(l2,P4(l2),'Color',apricot,'LineWidth',1.5);
title("Root of the Bessel Function of the First Kind (Cubic Lagrangian Interpolation)",'Fontsize',15,'interpreter','latex'); 
legend([B,L3,dA(1),L4,dB(1),r],{'Bessel Function','Cubic Lagrangian A','Interpolation Points A','Cubic Lagrangian B','Interpolation Points B','Real Root'},'Fontsize',14,'interpreter','latex');
hold off;
real_root = fzero(P3,[0 5]);
disp("The root calculated by fzero Matlab function")
disp(real_root)
disp("The root calculated by successive cubic Lagrangian interpolations")
disp(approx)
