close all
clear all
clc

%%
figure
subplot(321) % subplot(#row,#column,target_cell)
x=linspace(0,360,5);
plot(x,cosd(10*x)); % undersampled
legend('under sampled cos(10x)')

subplot(322)
x=linspace(0,360,50);
plot(x,cosd(10*x)); % undersampled 
legend('under sampled cos(10x)')

subplot(323)
x=linspace(0,360,500);
plot(x,cosd(10*x)); % proper sampling 
legend('cos(10x)')

%%

figure
t=linspace(0,1,6);

y1=sin(2*pi*t); % period T = 1 sec
y2=sin(12*pi*t); % period T = 1/6 sec

plot(t,y1,'-ob') % 6 samples in a period, yet not a smooth curve
legend('sin(2\pit)')
hold on

%%
plot(t,y2,'--r') % 1 sample in a period, looks exactly like sin(2?t) plot
legend('sin(2\pit)','sin(12\pit) with 1 sample per period')

%%
t3=linspace(0,1,30);
y2_3=sin(12*pi*t3); % period T = 1/6 sec
plot(t3,y2_3,'.-k'); % 5 sample in a period
legend('sin(2\pit)','sin(12\pit) with 1 sample per period',...
    'sin(12\pit) with 5 sample per period')


%%
t4=linspace(0,1,120);
y2_4=sin(12*pi*t4); % period T = 1/6 sec
plot(t4,y2_4,'-*m') % 20 sample in a period
legend('sin(2\pit)','sin(12\pit) with 1 sample per period',...
    'sin(12\pit) with 5 sample per period',...
    'sin(12\pit) with 20 sample per period')
