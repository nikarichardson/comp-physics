% Bisection Method  
% calculating the cube root of 169 using the bisection method 
close all; clear; clc;

% note lower and higher bound must have opposite values 
xs= 5.00; % lower bound
xf= 6.00; % higher bound 

for n=1:15
    xn=(xs+xf)/2;
    % equation 
    fn=xn.^3-169;
    % change in the sign 
    if fn > 0 
        xf=xn;
    else
        xs=xn;
    end
end 

cube_root_of_169 = xn;
disp("Bisection Method")
disp("cube_root_of_169")
disp(xn) 