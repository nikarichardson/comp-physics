%% Random II 
% generates a series of random numbers starting from uniform
% using pseudorandom generator between 0 and 1 
% and compares with MATLAB rand() via histograms
% (Prof's Refactored Code for xy-space) 
close all; clear; clc;

% colors--why not!
english_lavender = 1/255*[189,139,156];
palatinate_purple = 1/255*[104,45,99];
dark_slate_blue = 1/255*[65,66,136];
russian_green = 1/255*[92,148,110];
metal = 1/255*[42,45,52];
dark_slate_purple = 1/255*[65,51,122];

%% Linear Congruential Pseudorandom Number Generator
% generate first set of random numbers 
a = 7^5;                        
c = 0;
m = 2^31-1;
g = @(x) mod(a * x + c, m );   
nmr = zeros(100, 1); 
z = zeros(100*50 + 1 , 1 , 'uint64');
z(1) = 2; % starting value

for n = 1 : 100*50;
    z(n+1) = g(z(n));
end;

z = double(z)/m; 
c = 1;
g = @(x) mod(a * x + c, m ); 

% generate second set of random numbers                        
y1 = zeros(100*50 + 1 , 1 , 'uint64' );
y1(1) = 3;  % starting value
for n = 1 : 100*50;
    y1(n+1) = g(y1(n));
end;

y1 = double(y1)/m; 

% bin z  
sizez = size(z); 
kr = 0;
for i=1:sizez
    if y1(i)< 1-z(i)
        kr = kr+1;
        xpr(kr) = z(i);
    end
end

z = fix(xpr*100) + 1  ;  
x = 1:100; 
for n = 1 : kr
    nmr(z(n)) = nmr(z(n)) + 1;
end;
figure; 
set(gcf, 'Position', get(0, 'Screensize'));
subplot(1,2,1)
plot(x, nmr, 'v','Color',palatinate_purple)
title( 'Linear Congruential Generator Distribution Binned (Intervals of 0.01)' , 'FontSize' , 14,'interpreter','latex')
xlabel( 'Histogram (100 bins) of .5M runs' , 'Fontsize' , 14,'interpreter','latex')
ylabel( 'Frequency' , 'Fontsize' , 14,'interpreter','latex')

%% Matlab Random Num Generator 
nmr = zeros(100 ,1);
z = rand(100*50, 1);  
y2 = rand(100*50 ,1 );  

sizez = size(z); 
kr=0;
for i=1:sizez
    if y2(i) < 1-z(i)
        kr=kr+1;
        xpr(kr)=z(i);
    end
end
z = fix(xpr*100) + 1  ;  
x = 1:100; 
for n = 1 : kr
    nmr(z(n)) = nmr(z(n)) + 1;
end;
subplot(1,2,2) 
plot(x, nmr , 'v','Color',dark_slate_purple)
xlabel( 'Histogram (100 bins) of .5M runs' , 'Fontsize' , 14,'interpreter','latex')
ylabel( 'Frequency' , 'Fontsize' , 14,'interpreter','latex')
title( 'Matlab RNG (0.5M pts) Distribution Binned (Intervals of 0.01)' , 'FontSize' , 14, 'interpreter','latex')

% mail snippet is throwing an error
% on my computer, but code is the same
% as always! 
%{
Mail Snippet
%}
test=mfilename; 
str='&body=Hi%20Veronica,%0D%0A%0D%0AYour%20program%20works%20well,%20except%20for:';
email=strcat('richar34@pdx.edu?subject=[PH322%20feedback]%20', test, str);
url = ['mailto:',email];
web(url) 
