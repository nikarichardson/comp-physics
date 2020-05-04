% Newton-Raphson Legendre Polynomial
% finds the smallest positive root
% of the ninth legendre polynomial
% using the Newton-Raphson technique
close all; clear; clc;
tic

% initial guess
x0 = .25;
x = [x0]; 
i = 1; 

% ninth legendre polynomial function  
nlf = @(x) 1/128.*(12155.*x.^9-25740.*x.^7+18018.*x.^5-4620.*x.^3+315.*x);
df = @(x) 45/128.*(2431.*x.^8-4004.*x.^6+2002.*x.^4-308.*x.^2+7);

% colors--why not! 
palatinate_purple = 1/255*[104,45,99];
english_lavender = 1/255*[189,139,156];
dark_slate_blue = 1/255*[65,66,136];

% loop 
for n=1:5
     % equation 
    x(i+1) = x(i) - (nlf(x(i)) / df(x(i)));  
    i = i + 1;
end 

disp(("Smallest Positive Root of the Legendre Polynomial.")) 
disp(x(end))

