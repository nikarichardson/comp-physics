%% Drake Equation Factors
% program employing Drake Equation to calculate N
% with a randomly generated L factor from a prescribed range 
close all; clear; clc;

% colors--why not!
crimson = 1/255*[178,44,77];
pink_red = 1/255*[187,66,119];
purple = 1/255*[129,73,182];
indigo = 1/255*[57,74,178]; 
aqua = 1/255*[68,120,170];
blue_yellow = 1/255*[115,132,124];
yellow_orange = 1/255*[217,168,75];
orange_red = 1/255*[178,98,43];

disp('----------------------------------------------------------') 
%{ Dialog Prompt %} 
dlg_title = 'Drake Equation Factors'; % dialog title
prompt = {'Rate of formation of stars for development of intelligent life', 'Fraction of above stars with planetary systems','Number of planets per solar systems with life-suitable environment','Fraction of suitable planets with actual life','Fraction of life-bearing planets with intelligence','Fraction of civilizations emitting detectable technological signs'};
num_lines = 1; % how many lines for each input slot
default_input = {'10','0.5','0.5','0.1','0.5','0.5'}; % some random numbers...
answer = inputdlg( prompt , dlg_title , [1, length(dlg_title)+50], default_input); % num_lines , default_input );

% VARYING 
% N = num of civilizations in the Milky Way Galaxy whose electromagnetic emissions are detectable
% will vary 30-300,000

% rate of formation of stars suitable for the development of intelligent
% life per year
Rs = str2num(answer{1}); 
% num of stars in galaxy (200-400 billion) / estimated age (10 billion) 

% fraction of those stars with planetary systems
% estimated to be ~half of all stars
fp = str2num(answer{2});
% inside the goldilocks zone 

% number of planets per solar system with environment suitable for life
ne = str2num(answer{3});  

% the fraction of suitable planets on which life actually appears
fl =  str2num(answer{4});

% fraction of life bearing planets on which intelligent life emerges
fi = str2num(answer{5});

% fraction of civilizations that develop a technology that releases detectable signs of their existence into space
fc =  str2num(answer{6}); 

% L := length of time such civilizations release detectable signals into space
% we choose a fixed L in the range 500-5million
a = 500;
b = 5000000; 
L = (b-a).*rand(1,1) + a; 
N = round(Rs*fp*ne*fl*fi*fc*L); 
str = sprintf("There are estimated to be %s intelligent civilizations \nin the Milky Way Galaxy who emit detectable transmissions.",addComma(N)); 
disp(str)
str2 = sprintf("  Calculated with an L value of %s",addComma(round(L)));
disp(str2) 
disp('----------------------------------------------------------') 
% function for comma notation from MathWorks.com
% Ted Shultz
function numOut = addComma(numIn)
   jf=java.text.DecimalFormat; % comma for thousands, three decimal places
   numOut= char(jf.format(numIn)); % omit "char" if you want a string out
end