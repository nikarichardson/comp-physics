% The Feigenbaum Constant
% quantifies the approach of chaos via period doubling
% with the standard logistic map 
close all; clear; clc;
tic 

% WARNING!! 
% This program is slow. 6.350071 seconds slow,
% to be exact. (For a particular run.) 

% colors--why not! 
palatinate_purple = 1/255*[104,45,99];
english_lavender = 1/255*[189,139,156];
dark_slate_blue = 1/255*[65,66,136];

% generate a random starting value for x 
% in the interval 0.5-0.7 
xint = [0.5 0.7];
x = rand(1)*range(xint)+min(xint); 
zeroes = [];

for r=2.98:0.001:3.60 % iterate through r
    % generate the sequence 
    for n = 2:1000
        x(n) = r*x(n-1)*(1-x(n-1));
    end
    
    size_fill = r*ones(100,1); 
    
    % will hold the number of zeroes for this r
    count = 0; 
    
    % once transients have died down 
    for n = 900:1000
        % sequence x_n post-transients 
        t(n) = (x(n) - x(1000)); 
        
        % calculation of separation of adjacent elements 
        if abs(t(n)) < .00001
            % we found a "zero" at this r value 
            count = count +  1;
        end
    end
    
    % contains the zeroes alongside val of r param 
    zeroes = [zeroes ; r count]; 
    hold on; 
    
    % plotting the logistic map
    plot(size_fill, x(901:1000), '.','Color', english_lavender);
    title("The Standard Logistic Map With Demarcated Period Doubling")
    xlabel("r"); 
    ylabel("x_n");
end 
    
% Plot Pyrotechnics.
% r_1 
xline(2.998,'-',{'r = 2.998'},'LineWidth',1,'Color', palatinate_purple);

% r_2
xline(3.449,'-',{'r = 3.449'},'LineWidth',1,'Color', palatinate_purple);

% r_3 ~3.544
xline(3.5440,'-',{'r = 3.5440'},'LineWidth',1,'Color', palatinate_purple);

% r_4 ~3.5700
xline(3.5700,'-',{'r = 3.570'},'LineWidth',1,'Color', palatinate_purple);

% r_5 ~3.582
xline(3.582,'-',{'r = 3.582'},'LineWidth',1,'Color', palatinate_purple);

% r_6 ~3.584
xline(3.584,'-',{'r = 3.584'},'LineWidth',1,'Color', palatinate_purple);

% unmute this to see how the values in 'doubling' were found
zeroes;

% plotting the effective zeroes as a function of the parameter r
figure
hold on
plot(zeroes(:,1),zeroes(:,2),'Color', palatinate_purple) 
title("Zeroes as a Function of R Parameter") 
xlabel("r")
ylim([1 102]) 
ylabel("number of zeroes")

% values taken from the first col of zeroes array 
doubling = [2.998 3.449 3.5440 3.570 3.582 3.584]
r_1 = 2.998; 
r_2 = 3.449;
r_3 = 3.5440;
r_4 = 3.570;
r_5 = 3.582;
r_6 = 3.584; 

disp("-------------------------------------------") 
disp("Deltas") 
% n = 1 
% δ_0 = (r_3 - r_2) / (r_4 - r_3)
d0 =  (r_2 - r_1) / (r_3 - r_2)

% n = 2 
% δ_1 = (r_3 - r_2) / (r_4 - r_3)
d1 =  (r_3 - r_2) / (r_4 - r_3)

% n = 3
% δ_2 = (r_4 - r_3) / (r_5 - r_4)  
d2 = (r_4 - r_3) / (r_5 - r_4)  

% n = 4 
% δ_3 = (r_5 - r_4) / (r_6 - r_5)
d3 = (r_5 - r_4) / (r_6 - r_5)
disp("-------------------------------------------")

% Approximation of the Feigenbaum Constant 
% lim n-> ∞ (r_n+1 - r_n) / (r_n+2 - r_n-1) 
F = mean([d0 d1 d2 d3])

% The Feigenbaum constant is ~4.669
% 12.7233%
toc 

% returns the XN with given parameter and N 
function x = getXN(r,N)
    % initial condition 
    x = rand(); 
    for idx = 2:N
        % equivalent equation x_n+1 = r*x_n(1-x_n)
        x = r.*x.*(1-x); 
    end 
end
