close all
clear all
clc

a=[6 4 2]  % array
b=2  % scaler

a_by_b=a/b   % array divided by a scaler 

a_times_b=a*b % array multiplied by a scaler 

c=[3 2 2] % array 

a_by_c=a/c % I don't know what it does

% a_times_c=a*c % dimension error

a_dot_by_c=a./c  % element by element division

a_dot_by_c1=[a(1)/c(1) a(2)/c(2) a(3)/c(3)]

a_dot_times_by_c=a.*c  % element by element division

a_dot_times__c1=[a(1)*c(1) a(2)*c(2) a(3)*c(3)]

% 2^c  % error 2^[3 2 2]

2.^c  % [2^3 2^2 2^2]

% c^2  %error [3 2 2]^2

c.^2 %[3^2 2^2 2^2]

