close all
clear all
clc
% 
% a=zeros(2) % 2x2 matrix with all zero(0) elements
% b=zeros(2,3) % 2x3 matrix
% var_c=[1 2; 3 4; 5 6]
% 
% dim_of_var_c=size(var_c)  % [#row_of_var_c #column_of_var_c]=[3 2]
% 
% e=zeros(size(var_c))  % zeros(3,2)
% 
% z=[zeros(4,1) ones(4,1) zeros(1,4)']  
% 
% size_of_z=size(z)
% 
% length_of_z=length(z)% returns number of rows, each row is considered an element


%% finding elements in a matrix

var_d=[11 4 6; 10 6 8; 8 9 10]

% [r8 c8]=find(var_d==8)
% 
% find_8=find(var_d==8)  % returns the row number
% 
% [r9 c9]=find(var_d==9) % returns index of all 9s

%% Imax(A) is a row vector containing the maximum value of each column

 [value_max index_max]=max(var_d)  % need smarter programming to find the proper index


