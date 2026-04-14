close all
clear all
clc

% x=20:2:50;
 x=20:0.01:50;

y=x.^2;

plot(x,y)
xlabel('x')
ylabel('y')

%% int(y) limits x==30 to x==40
ind1=find(x==30)
ind2=find(x==40)

int_res=trapz(x(ind1:ind2),y(ind1:ind2))  

%% integrating with only one array: integrating w.r.t. index
t1=20:0.2:50;
t2=20:0.1:50;

I1=trapz(t1.^2) % the result will vary depending on number of data points / indices
I2=trapz(t2.^2)