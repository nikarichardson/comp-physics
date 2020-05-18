% Integration III 
% numerically integrates the Fresnel integrals
% to obtain the diffraction pattern of a knife edge
% I_0 is the irradiance on a screen without knife edge
% (pattern from a plane wave incident on semi-infinite plane)
close all; clear; clc;

% colors--why not!
english_lavender = 1/255*[189,139,156];
dark_slate_blue = 1/255*[65,66,136];
russian_green = 1/255*[92,148,110];
metal = 1/255*[42,45,52];
dark_slate_purple = 1/255*[65,51,122];

Sf =  @(z) sin(pi*z.^2/2); % dz
Cf =  @(z) cos(pi*z.^2/2); % dz

x = linspace(-10,20,1000); 
for k = 1:numel(x)
    S(k) = integral(Sf, 0, x(k));
end 

for k = 1:numel(x)
    C(k) = integral(Cf, 0, x(k));
end 

s = 1; 
for i = 1:size(S)
    s = .5*((.5+S).^2 + (.5+C).^2 );
end

plot(x,s,'Color',english_lavender,'LineWidth',1); 
title("Diffraction Pattern of Knife Edge With Numerical Integration of Fresnel Integrals",'interpreter','latex') 
ylabel("$x$",'interpreter','latex'); 
xlabel("$\frac{I}{I_0} = 0.5[(\frac{1}{2} + S(w))^2 + (\frac{1}{2} + C(w))^2]$",'interpreter','latex');  