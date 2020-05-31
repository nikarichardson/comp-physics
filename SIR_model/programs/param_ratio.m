% I(S) and I(S) = 0 
% graphing I(S) on 0 < S < 1 & I(S) = 0 as a function of ρ=β/α.
% I(S) represents the fraction of the population that is sick
% during the epidemic 
% graph eludicates the fact that the SIR model
% depends only on the ratio of β/α
% Solution curves of the SIR model 
%   S(0) ≈ 1 and I(0) ≈ 0)   are graphs of I(S) 
%   Let ρ = β/α.
%   I(S) = -S + ρ ln(S) + 1
close all; clear; clc;
set(gcf, 'Position', get(0, 'Screensize'));

warning('off');
j = 1; 
subplot(2,1,1);
hold on;
for p=linspace(0.1,1.0,6)
    k = 1;
    for s = linspace(0,1,100)
        I(k) = -s - p*log(s) + 1;
        k = k+1; 
    end
    lin = linspace(0,1,100); 
    str = sprintf('ρ = %s',strtrim(rats(p))); 
    plot(lin,I,'LineWidth',1.5,'DisplayName',str);
    hold on; 
end
xlim([0.01 1]);
title("$I(S)$ : the SIR Model as a Function of $S$ with $\rho = \frac{\beta}{\alpha}$",'interpreter','latex')
xlabel("$S$",'interpreter','latex');
ylabel("$I(S)$",'interpreter','latex');
hold off; 
legend('interpreter','latex'); 

% Implicitly Graph I(S) = 0 ⇒
% S = ρ*log(S) + 1
% I(S) = 0 measures the fraction of the population that avoids
% getting infected altogether 
% As ρ approaches 1, the population that is infected
% approaches 0 
subplot(2,1,2);
p = linspace(0.1,1.0,100); 
s =  linspace(0,1,100); 
S = p.*log(s) + 1; 
plot(p,S) 
xlim([0.3 1])
xlabel("$\rho$",'interpreter','latex')
ylabel("$S$",'interpreter','latex')
title("$I(S) = 0$ as a function of $\rho = \frac{\beta}{\alpha}$",'interpreter','latex')
