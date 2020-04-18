% pendulum I 
% plots the standard solution of a pendulum starting from rest
close all; clear; clc;

t=0:0.01:10;
a0=0.1;
g=9.8;
l=4;
arr=zeros(1,length(t));

% single line answer: a=a0*cos(sqrt(g/l)*t) 
for id=1:length(t) 
    arr(id)=a0*cos(sqrt(g/l)*t(id));
end 

plot(t,arr)
title("The Motion of a Pendulum")
ylabel("t")
xlabel("\alpha(t) = \alpha_0 cos(\surd{g/l * t})") 