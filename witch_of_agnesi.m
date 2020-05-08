% The Witch of Agnesi  
% plots the famous curve of Maria Agnesi 

close all; clear; clc;

% function calls
witch_of_Agnesi(.25);
witch_of_Agnesi(.5); 
witch_of_Agnesi(.75);
witch_of_Agnesi(1); 
witch_of_Agnesi(1.25); 
witch_of_Agnesi(1.5); 
witch_of_Agnesi(1.75); 
witch_of_Agnesi(2); 
witch_of_Agnesi(2.25); 
witch_of_Agnesi(2.5); 
witch_of_Agnesi(2.75); 
witch_of_Agnesi(3);
witch_of_Agnesi(3.25);
witch_of_Agnesi(3.5);
witch_of_Agnesi(3.75);
witch_of_Agnesi(4);
hold off; 

function witch_of_Agnesi(a)
    x = linspace(-10,10);
    y = 8*a^3 ./ (x.^2 + 4.*a.^2);
    plot(x,y)
    xlabel("$x$",'interpreter','latex')
    ylabel("$y = 8a^{3} / (x^{2} + 4a^{2})$",'interpreter','latex')
    title("The Witch of Agnesi",'interpreter','latex')
    ylim([0 8.35])
    hold on; 
end 
