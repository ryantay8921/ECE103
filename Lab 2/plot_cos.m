close all
clear all
clc

x=0:2:360;        % (in degree) first_value : increment : last_value

% plot(x_axis_variable,y_axis_variable)
plot(x,cosd(x));  % cosd() function takes argument in degrees
hold on
plot(x,cosd(5*x));
xlabel('Angle x (degree)');
legend('cos(x)','cos(5x)')
                    
%%
figure
y=cosd(5*x);
plot(y)    % polts value of y w.r.t its index [y(1) y(2) y(3) ... y(end)]
xlabel('Index of array y')
ylabel('cos(5x)')