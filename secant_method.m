% Secant Method
% find the cube root of 169 with the secant method 
close all; clear; clc;

% initial approximations
xs= 5.00; 
xf= 6.00;

palatinate_purple = 1/255*[104,45,99];
english_lavender = 1/255*[189,139,156];
dark_slate_blue = 1/255*[65,66,136];

%fx=x^3-169; 
f= @(x)x.^3-169;

disp("Secant Method")
% ----------------------------------
% secant method 
% using a fixed number of iterations
% as the convergence criterion 
x = [xs,xf]; 
i = 2; 
tic
for n=1:4
    num = f(x(i)) * (x(i) - x(i-1)); 
    %if num < 0
    %    break 
    %end
    denom = f(x(i)) - f(x(i-1)); 
    next_val =  x(i) - num/denom; 
    x = [x, next_val]; 
    i = i + 1; 
end  
toc
disp("cube_root_of_169")
disp(vpa(x(end), 10)) 


% ----------------------------------
% compare with bisection method
% note: lower and higher bound must
% have opposite values 
xs= 5.00; % lower bound
xf= 6.00; % higher bound 

disp("------------------------------") 
disp("Bisection Method")
tic
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
toc
disp("cube_root_of_169")
disp(vpa(xn,10)) 


disp("------------------------------") 
disp("Wolfram Alpha Cube Root of 169") 
% Exact Cube Root to 9 Digits from Wolfram Alpha 
disp(vpa(5.528774813,10)) 