% Logistic Map Redux 
% with plotted sequences of N vs X_n for different values of r 
% for three values of r 
close all; clear; clc;

% initial condition 
x1 = rand();

palatinate_purple = 1/255*[104,45,99];
english_lavender = 1/255*[189,139,156];
dark_slate_blue = 1/255*[65,66,136];

% 601 rs
r = 3.53:0.0001:3.59;
size(r); 
N = 1000;

rvals = linspace(3.53,3.59,3); 
x = getXN(r,N);

figure
set(gcf, 'WindowState', 'maximized');
% ------------------------------------
% Plotting Without Transient Values  
% continuously plot n values
% plot once the transients have died down
subplot(2,2,1)
for n=N-50:N
    % equivalent equation x_n+1 = r*x_n(1-x_n)
    x = r.* x.* (1-x); 
    xlim([3.53 3.59]); % r
    ylim([0.4 0.6]); % x_n
    plot(r,x,'k.');
    xlabel("r"); 
    title("Logistic Map X_{n+1} = r*X_{n}(1-X_{n})");
    ylabel("X_{n}");
    hold on
end

hold off

subplot(2,2,2);

X = zeros(1,100);
X(1)=rand(); 
r = [3.5300, 3.5600, 3.5900];
plots = [];
for i=1:3 
    for id=2:100
        X(id)= r(i)*X(id-1)*(1-X(id-1));
    end;
    edx = X(50:end);
    % building a concatenated nested matrix
    plots = cat(3,plots,edx);
end 

n=50:100; 
plot(50:100,plots(:,:,1),'Color', palatinate_purple,'DisplayName','r=3.53') 
ylabel("X_{n}"); 
xlabel("N"); 
title("N vs X_{n} for r=3.53");

subplot(2,2,3)
plot(50:100,plots(:,:,2),'Color', english_lavender,'DisplayName','r=3.56')
ylabel("X_{n}"); 
xlabel("N"); 
title("N vs X_{n}  for r=3.56");

subplot(2,2,4)
plot(50:100,plots(:,:,3),'Color', dark_slate_blue,'DisplayName','r=3.59') 
ylabel("X_{n}"); 
xlabel("N"); 
title("N vs X_{n}  for r=3.59");

% returns the XN with given parameter and N 
function x = getXN(r,N)
    % initial condition 
    x = rand(); 
    for idx = 2:1000 
        % equivalent equation x_n+1 = r*x_n(1-x_n)
        x = r.*x.*(1-x); 
    end 
end