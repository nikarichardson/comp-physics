%% Examples of Varying Drake Factors 
% some subplots containing examples of possible
% factors to the Drake Equation & the changing
% upper and lower bounds 
close all; clear; clc;
set(gcf, 'Position', get(0, 'Screensize'));

% colors--why not!
crimson = 1/255*[178,44,77];
pink_red = 1/255*[187,66,119];
purple = 1/255*[129,73,182];
indigo = 1/255*[57,74,178]; 
aqua = 1/255*[68,120,170];
blue_yellow = 1/255*[115,132,124];
yellow_orange = 1/255*[217,168,75];
orange_red = 1/255*[178,98,43];

%{ Dialog Prompt %} 
dlg_title = 'Drake Equation Factors'; % dialog title
prompt = {'Rate of formation of stars for development of intelligent life', 'Fraction of above stars with planetary systems','Number of planets per solar systems with life-suitable environment','Fraction of suitable planets with actual life','Fraction of life-bearing planets with intelligence','Fraction of civilizations emitting detectable technological signs'};
num_lines = 1; % how many lines for each input slot
default_input = {'10','0.5','0.5','0.1','0.5','0.5'}; % some random numbers...
answer = inputdlg( prompt , dlg_title , [1, length(dlg_title)+50], default_input); % num_lines , default_input );

% see main program for description of each variable
% eliminated here for efficiency 

% PLOT I 
subplot(2,2,1)
Rs = 10; 
fp = 0.5; 
ne = 0.5; 
fl =  0.1;
fi = 0.5;
fc =  0.5;
a = 500;
b = 5000000;
mat = []; 
j = 1; 
N = 0; 

% varying L 
for L=linspace(500,5000000,10000)
    mat(j) = round(Rs*fp*ne*fl*fi*fc*L); 
    j = j + 1; 
end

L_domain = linspace(500,5000000,10000); 
title("Visualization I of the Drake Equation",'interpreter','latex'); 
hold on;
xlabel("$L$",'interpreter','latex')
ylabel('$N$','interpreter','latex')
plot(L_domain,mat,'Color',blue_yellow,'LineWidth',1.5); 
yline(mat(1),'Color',crimson,'LineWidth',1.5);
str1=sprintf('N = %s civilizations',addComma(mat(1)));
str2=sprintf('N = %s civilizations',addComma(mat(end)));
text(10^6,mat(1)+8000,str1,'interpreter','latex'); 
text(10^6,mat(end)+8000,str2,'interpreter','latex'); 
yline(mat(end),'Color',indigo,'LineWidth',1.5); 
ylim([-10000 350000]);
hold off; 

% PLOT II
subplot(2,2,2)
Rs = 10; 
fp = 0.5; 
ne = 0.5; 
fl =  0.1;
fi = 0.5;
fc =  0.2;
a = 500;
b = 5000000;
mat = []; 
j = 1; 
N = 0; 

for L=linspace(500,5000000,10000)
    mat(j) = round(Rs*fp*ne*fl*fi*fc*L); 
    j = j + 1; 
end

L_domain = linspace(500,5000000,10000); 
title("Visualization II of the Drake Equation",'interpreter','latex'); 
hold on;
xlabel("$L$",'interpreter','latex')
ylabel('$N$','interpreter','latex')
plot(L_domain,mat,'Color',yellow_orange,'LineWidth',1.5); 
yline(mat(1),'Color',orange_red,'LineWidth',1.5);
str1=sprintf('N = %s civilizations',addComma(mat(1)));
str2=sprintf('N = %s civilizations',addComma(mat(end)));
text(10^6,mat(1)+8000,str1,'interpreter','latex'); 
text(10^6,mat(end)+8000,str2,'interpreter','latex'); 
yline(mat(end),'Color',aqua,'LineWidth',1.5); 
ylim([-10000 350000]);
hold off; 

% PLOT III
subplot(2,2,3)
Rs = 10; 
fp = 0.2; 
ne = 0.3; 
fl =  0.15;
fi = 0.4;
fc =  0.5;
a = 500;
b = 5000000;
mat = []; 
j = 1; 
N = 0; 

for L=linspace(500,5000000,10000)
    mat(j) = round(Rs*fp*ne*fl*fi*fc*L); 
    j = j + 1; 
end

L_domain = linspace(500,5000000,10000); 
title("Visualization III of the Drake Equation",'interpreter','latex'); 
hold on;
plot(L_domain,mat,'Color',pink_red,'LineWidth',1.5); 
yline(mat(1),'Color',purple,'LineWidth',1.5);
xlabel("$L$",'interpreter','latex')
ylabel('$N$','interpreter','latex')
str1=sprintf('N = %s civilizations',addComma(mat(1)));
str2=sprintf('N = %s civilizations',addComma(mat(end)));
text(10^6,mat(1)+8000,str1,'interpreter','latex'); 
text(10^6,mat(end)+8000,str2,'interpreter','latex'); 
yline(mat(end),'Color',blue_yellow,'LineWidth',1.5); 
ylim([-10000 350000]);
hold off; 

% PLOT IV 
subplot(2,2,4)
Rs = 10; 
fp = 0.5; 
ne = 0.5; 
fl =  0.1;
fi = 0.8;
fc =  0.6;
a = 500;
b = 5000000;
mat = []; 
j = 1; 
N = 0; 

for L=linspace(500,5000000,10000)
    mat(j) = round(Rs*fp*ne*fl*fi*fc*L); 
    j = j + 1; 
end

L_domain = linspace(500,5000000,10000); 
title("Visualization IV of the Drake Equation",'interpreter','latex'); 
hold on;
plot(L_domain,mat,'Color',aqua,'LineWidth',1.5); 
xlabel("$L$",'interpreter','latex')
ylabel('$N$','interpreter','latex')
yline(mat(1),'Color',crimson,'LineWidth',1.5);
str1=sprintf('N = %s civilizations',addComma(mat(1)));
str2=sprintf('N = %s civilizations',addComma(mat(end)));
text(10^6,mat(1)+12000,str1,'interpreter','latex'); 
text(10^6,mat(end)+12000,str2,'interpreter','latex'); 
yline(mat(end),'Color',yellow_orange,'LineWidth',1.5); 
ylim([-10000 640000]);

% function for comma notation from MathWorks.com
% Ted Shultz
function numOut = addComma(numIn)
   jf=java.text.DecimalFormat; % comma for thousands, three decimal places
   numOut= char(jf.format(numIn)); % omit "char" if you want a string out
end