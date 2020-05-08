% linear least squares fitting 
% plotting a polynomial fitting for y to x and x to y
close all; clear; clc;

x=0:9; 
y=17-3*x+rand(size(x)); 

% Plot A 
% y fitted to x
% y ~ x 
hold on;
p = polyfit(x,y ,4 ); % polynomial fitting 4th order 
g = polyval( p , x ); % evaluate the fit
grid on;
plot(x,y,'r*','DisplayName','data A')
% Small x limit chosen so both lines can 
% be seen clearly as distinctive.  
% Comment out the following line if full view is desired.
xlim([2.17 2.18])
hold on; 
plot(x, g,'b-','DisplayName','best fit A') % plot fit and data together
title( '$Polynomial Fitting Y ~ X & X ~ Y$','interpreter','latex')
disp("------------------------------------") 
disp("Slope and Intercept of A") 
a_slope = p(1)
grid on; 
a_intercept = p(2)

% Plot B 
% x fitted to y 
% x ~ y 
p = polyfit(y,x,4); % polynomial fitting 4th order
g = polyval(p,y); % evaluate the fit
plot(x, y, 'g*','DisplayName','data B')
hold on;
plot(g,y,'m-','DisplayName','best fit B') 
disp("------------------------------------") 
disp("Slope and Intercept of B") 
b_slope = p(1)
b_intercept = p(2)
text(10,-5,'b_slope')

disp("------------------------------------") 
disp("Why are the curves different?") 
disp("It makes sense that the curve fits")
disp("are not exactly the same, since the linear")
disp("regression will produce different slopes")
disp("that are not inverses of each other.")
disp("The more correlated the lines are, the more") 
disp("that both linear regressions will resemble")
disp("each other.")

legend
figure;

% Optional. 
% Better View With Subplot 
grid on; 
subplot(1,2,1)
p = polyfit(x,y ,4 ); % polynomial fitting 4th order 
g = polyval( p , x ); % evaluate the fit
plot( x, y ,'r*','DisplayName','data')
hold on;
plot(x ,g ,'b-','DisplayName','best fit') % plot fit & data together
title( '$Polynomial Fitting Y ~ X$','interpreter','latex')
a_slope = p(1);
a_intercept = p(2);
legend
grid on;
 
subplot(1,2,2)
p = polyfit(y,x,4); % polynomial fitting 4th order
g = polyval(p,y); % evaluate the fit
plot(x, y,'g*','DisplayName','data')
hold on; 
plot(g,y,'m-','DisplayName','best fit') % plot fit & data together
title( '$Polynomial Fitting X ~ Y$','interpreter','latex')
b_slope = p(1);
b_intercept = p(2);
grid on;
legend
