close all
clear all
clc


% p=[1,2,3; 4,5,6]   % elements in a row are separated with comma (,) or space 
% 
% q=[1 2 3; 4 5 6]  % rows are separated with a semicolon
% 
% r=[1 2 3		% line break creates a new row 	
% 4 5 6]
% 
% s=[1 2 3 ...	% continue a statement to the next line using ellipsis (...)
% 4 5 6]
% 
% 
% m=[1 2 3]    % row matrix
% 
% n=[1 2 3]'  % the ' operator transpose a matrix , results in a column matrix here
% 
% 
% 

%% indexing

x=[1,2,3; 4,5,6]   % elements in a row are separated with comma (,) or space 

 x(2,2) % ERROR! Array/matrix indexing starts with 1 in Matlab, not 0 like some other language  

x2=x(2);

x5=x(5);
% 
% x2_2=x(2,2)  % is equivalent to x(5), but it's a good practice to use row and column index
% 
%  x3_end=x(3:end)  % 'end' identifies the last element, also used in control flow (loop/if/else) 
% 


%% 
% a=[5 1+7];
% 
% b=[a(2) 7 a; x(3:end)]
% 
% b12_12=b(1:2,1:2)
% 
% b_row_1=b(1,:)   % row 1
% 
% b_col_3=b(:,3)  % column 3
% 
%% 
% %% first_value: increment :last_value
% 
% 
% angles_1=(1/100:1/100:1)*pi;
% 
% angles_2=(pi/100:pi/100:pi);
% 
% angles_3=linspace(pi/100,pi);
% 
% angles_4=linspace(pi/100,pi,100);

% %
% xx=5:10  % default value of 'increment' is 1
% 
% yy=10:-2:2  % negative increment 
% 
% %
% 
%  zz=logspace(1,5,7)







