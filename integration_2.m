% Integration II
% solving (approximately)
% I = ∫ dx_1 ∫ dx_2 ... ∫ dx_10 (x_1 + ... x_10)^2
% from 0 to 1 
% Nika Richardson 
close all; clear; clc;

% colors--why not! 
english_lavender = 1/255*[189,139,156];
dark_slate_blue = 1/255*[65,66,136];
russian_green = 1/255*[92,148,110];
metal = 1/255*[42,45,52];
palatinate_purple = 1/255*[104,45,99];

for m=1:100  
    for n=1:1000
        r = rand(10,1); 
        su = (sum(r)).^2; 
        arr(n) = su; 
    end
    ans(m) = mean(arr); 
end

avg = mean(ans);
disp("Average:")
disp(avg)
stdv = std(ans);
disp("Standard deviation:")
disp(stdv) 
disp("Correct number:") 
answer = 155/6;
disp(answer)

ans_error = abs(avg-answer)/(answer) * 100;
fprintf('Percent error: \n % 0.8f %% \n', ans_error);