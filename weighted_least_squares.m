% Weighted Least Squares
% plots height as a function of time & uses weighted
% least squares equations to fit a line 
close all; clear; clc;

% reading data from file:
s = load('erdinger_weiss.txt' );

t_rnd = s(:,1); % extract 1st column time
h_rnd = s(:,2); % extract height column
sigma_rnd = s(:,3); % extract standard deviation 
h_0 = 17.0;

% POLYFIT VERSION 1
% initial height 
h_0 = 17.0;

% half-life of Erdinger foam 
tau = 270; 

x=h_rnd;
y=t_rnd; 

% plot the data
plot(t_rnd,h_rnd,'*','DisplayName','data','Color',[100/255	149/255	237/255]); 
xlabel("time (s) ");
ylabel("height (cm) ");
title("Height of Erdinger Beer Froth As a Function of Time (V1: Polyfit)");

% linearized form
% ln(h_0) = t/tau + ln(h) 
h=log(h_0)-t_rnd/tau;  
p = polyfit(t_rnd,h_rnd,2);
hold on; 
g = polyval( p , t_rnd );
plot(t_rnd, g,'b-','DisplayName','polynomial fit','Color',[0/255	199/255	140/255]);
legend; 
hold on; 

% POLYFIT VERSION 2 
h_prime=log(h);
p=polyfit(t_rnd,h_prime,1);
a=p(2);
b=p(1);

figure; 
% plot(t_rnd, log(h), 'p',t_rnd, polyval(p, t_rnd), '-m')
plot(t_rnd, h,'*','Color',[75/255 0/255 130/255])
hold on;
xlabel("time (s) ");
ylabel("height (cm) ");
plot(t_rnd, exp(a)*exp(t_rnd*b),'-','Color',[220/255 20/255	60/255])
title("Height of Erdinger Beer Froth As a Function of Time (V2: Polyfit)");

% VERSION 3 wlsqr
% the method of determinants 
x = t_rnd;
y = h_rnd;
% original sigma
sigma_sqr_i = (sigma_rnd).^2;

fst_sum = sum(1./(sigma_sqr_i));
snd_sum = sum((x.^2)./(sigma_sqr_i));
trd_sum = (sum((x)./(sigma_sqr_i)));
delta = fst_sum*snd_sum - (trd_sum)^2;

delta = sum(1./(sigma_sqr_i)) * sum((x.^2)./(sigma_sqr_i))-(sum((x)./(sigma_sqr_i))^2);
fst1 = sum(x.^2./sigma_sqr_i) * sum(y./sigma_sqr_i);
snd1 = sum(x./sigma_sqr_i) * sum(x.*y./sigma_sqr_i);

a = 1/delta * (fst1 - snd1);

fst2 = sum(1./sigma_sqr_i) * sum(x.*y./sigma_sqr_i);
snd2 = sum(x./sigma_sqr_i) * sum(y./sigma_sqr_i);
b = 1/delta * (fst2 - snd2);

figure;
f = a + b*x;

% Error in the Coefficients
sigma_sqr_a = 1/delta * sum(x.^2./sigma_sqr_i);
disp("Error in A")
disp(sigma_sqr_a)
sigma_sqr_b = 1/delta * sum(1/sigma_sqr_i); 
disp("Error in B")
disp(sigma_sqr_b)

% sigma h error propagation
% (squared by definition)
% sigma_h^2 = sigma_i^2 (h_0 e^(-2t/tau/(tau^2))
% sigma_sqr_h = sigma_sqr_i .* (h_0^2*exp(-2.*t_rnd/tau)./(tau^2)) 
sigma_sqr_h = 1/(sum(1./sigma_sqr_i));
disp("Sigma_h^2:")
disp(sigma_sqr_h)
disp("(from partial derivative and sigma_i^2)") 

% plot the data
plot(t_rnd,h_rnd,'*','DisplayName','data','Color',[100/255	149/255	237/255]); 
hold on; 
title("Weighted Least Squares Fit for Beer Foam (V3: Method of Determinants)") 
plot(x, f,'DisplayName',"best fit")
xlabel("time (s) ");
ylabel("height (cm) ");
legend; 