% solving linaer equations with Matrix opeariotn 

close all
clear all
clc

A=[1 -2 3;-sqrt(3) 1 -sqrt(5); 3 -sqrt(7) 1]

 b=[1 pi exp(1)]' % column matrix

 X=inv(A)*b
% 
 X1=A\b

 
%%% Testing backslash vs inv()
% The backslash calculation is quicker and has less residual error by
% several orders of magnitude. The fact that err_inv and err_bs are both on
% the order of 1e-6 simply reflects the condition number of the matrix.
% 
% The behavior of this example is typical. Using A\b instead of inv(A)*b 
% is two to three times faster, and produces residuals on the order of 
% machine accuracy relative to the magnitude of the data.

%  https://www.mathworks.com/help/matlab/ref/inv.html?searchHighlight=inv