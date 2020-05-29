% Integration I
% integrating a two dimensional integral 
% with the trapezoidal rule 
close all; clear; clc;

N = 16:1024;  
three = 3.*N; 
N = 16:three:1024; 

% colors--why not! 
english_lavender = 1/255*[189,139,156];
dark_slate_blue = 1/255*[65,66,136];
russian_green = 1/255*[92,148,110];
metal = 1/255*[42,45,52];
palatinate_purple = 1/255*[104,45,99];

% for a given value of x 
% we evaluate integral with trapezoidal rule 
% f(x) = integral sin(xy)dy 
% now integrate f(x) dx from 0 to 1
% nested four loops 
xi = linspace(0,1,1000); 
a = 0; 
h = .001; 
for n = 1:1001
    x = (n-1)*h; 
    % integrate hy = sqrt(1-x^2)/1000 from 0 to 1-x^2
    hy = sqrt(1-x^2)./1000; 
    s = 0;  
    % now we compute the integral for each x 
    for m = 1:1001
        y = (m-1).*hy; 
        % now use trapezoidal rule
        s = s + sin(x.*y);  
    end
    s = s - 1/2 .* [sin(x.* sqrt(1-x^2))]; 
    s = s .* hy; 
    a = a + s;
end

disp("Double Integral With Trapezoidal Rule") 
a = (a - 1/2*0)*h; % correction terms for beginning % end 
disp(a);

disp("Answer from Integration") 
% Correct answer 
% found from actual integration 
answer = 0.123275; 
disp(answer);