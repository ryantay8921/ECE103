close all
clear all
clc

t=-10:1/10:10;  % time 


%% populating an output array by calling the function with one 
% element input argument at a time 
for ii=1:length(t)
    signal1(ii)=signal_defination2(t(ii));
end

%% populating an output array by using Matlab inbuilt function: arrayfun()

signal2 = arrayfun(@signal_defination2, t);

%%

subplot(211)
plot(t,signal1)
xlabel('t')

subplot(212)
plot(t,signal2)
xlabel('t')
