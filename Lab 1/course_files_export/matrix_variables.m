close all
clear all
clc


% % Matlab is case-sensitive language
% 
% A=[5 1];
% a=[1 5];
% 
% Aa=[A a]
% 
% A
% 
% A=a;
% 
% A
% 
% %

% 1st_variable=1  % invalid variable name, cannot start with a number 

sin_of_48_=sin(48)  % invalid variable name, cannot start with underscore

sin_of_48_=sin(48)  % argument 48 is in radian not in degree

my_sin_in_degree_48=my_sin_in_degree(48)

sind(48)

s=sind(48)  % 'sin' is defined as a variable, overrides the function 'sin'

answer1=s

answer2=sin(48/180*pi) % 'sin' is defined as a variable locally, no longer workes as a function





