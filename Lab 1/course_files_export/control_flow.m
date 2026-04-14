close all
clear all
clc

a=0;
b=sin(pi);
% 
% display('a==b')
% a==b
% 
% display('abs(a-b)<1e-14')
% abs(a-b)<1e-14
% 
% display('4>=4')
% 4>=4
% 
% 
% %%
% 
% if a==b
%     display('"a" and "b" are equal')  % rounding error with 'pi'
% 
% else
%     display('"a" and "b" are not equal') % rounding error with 'pi'
%     display('lets try to be more specific') 
% end
% 
% % 
% % %%
% if ~(a>b) & ~(b>a)   % 'a' is not greater than 'b' and vice versa 
%     display('"a" and "b" are equal')  % rounding error with 'pi'
% elseif a>b
%     display('"a" is grater than "b"')   
% else
%     display('"b" is grater than "a" ') % rounding error with 'pi'
%     
% end


%% loop 

% condition_var=10;
% loop_count=0;
% 
% while condition_var>3
%     condition_var=condition_var-2
%     loop_count=loop_count+1
% end

%% 

% loop_count=0;
% 
% for condition_var=10:-2:3
%     condition_var
%     loop_count=loop_count+1
% end

%% 
condition_var=10:-2:3

for ii=1:length(condition_var)   %% 'ii' is inedx/loop counting variable
    
    ii
    display('condition_var(ii)')
    condition_var(ii)
    
    new_var1(ii)=condition_var(ii)^2;  
end

new_var1

 new_var2=condition_var.^2   % Matrix operation in faster than loops
    

    
