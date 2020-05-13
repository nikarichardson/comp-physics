% Linear, Quadratic, and Cubic Interpolations 
% interpolating 11 data points of the airy pattern 
close all; clear; clc;

% colors--why not! 
english_lavender = 1/255*[189,139,156];
dark_slate_blue = 1/255*[65,66,136];
russian_green = 1/255*[92,148,110];
metal = 1/255*[42,45,52];

I0 = 1; 
I = @(x) I0 * ((2.*besselj(1,x)) / x).^2; 
t = linspace(0,10,100);  

I0 = 1; 
t = [0,1,2,3,4,5,6,7,8,9,10]; 

mat = []; 
for rh = t;
    mat = [mat,I(rh)/I0]; 
end

% Plot the Airy Pattern
A = plot(t,mat,'LineWidth',1.5);  

% Linear Interpolation
l = linspace(0,10); 
P1 =  @(x) 0.008506 .* (x-5) + 0.01717.*(6-x);
hold on; 
L1 = plot(l,P1(l),'Color',english_lavender);

% Quadratic Interpolation
P2 =  @(x) 0.00109*(x-5).*(x-6)./2 + 0.01717.*((x-4).*(x-6))./(-1) + 0.008506.* ((x-4).*(x-5))./2;
L2 = plot(l,P2(l),'Color',dark_slate_blue);

% Cubic Interpolation
P3 = @(x) 0.05109.* ((x-4).*(x-5).*(x-6))/-6 + 0.00109 .* ((x-3).*(x-5).*(x-6))/2 + 0.01717 .* ((x-3).*(x-4).*(x-6))/-2 + 0.008506 .* ((x-3).*(x-4).*(x-5))/6;
L3 = plot(l,P3(l),'Color',russian_green);

% marking clearly the four points used for interpolation 
d(1) = plot(3,0.05109,'r*','Color',metal);
d(2) = plot(4,0.00109,'r*','Color',metal);
d(3) = plot(5,0.01717,'r*','Color',metal);
d(4) = plot(6,0.008506,'r*','Color',metal);

% finishing the graph
legend([A,L1,L2,L3],{'$I(t)= I_0 * [2J(\rho)/\rho]^2$','Linear Lagrangian','Quadratic Lagrangian','Cubic Lagrangian'},'interpreter','latex');
title("Linear, Quadratic, and Cubic Lagrangian Interpolation of The Airy Pattern",'interpreter','latex'); 
ylim([0 0.15])
ylabel("$I(t)/I_0$",'interpreter','latex') 
xlabel("$\rho = kasin\theta$",'interpreter','latex')

