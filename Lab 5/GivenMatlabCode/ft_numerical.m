close all
clear all
clc
set(0,'DefaultAxesFontSize',30);  % set the font size of plot window 

%%
%  dT=0.0001;
dT=0.001;
t = 0:dT:2; % Time vector 
f = 2; % Create a square wave of f Hz.
x = 2*square(2*pi*t*f);
figure (1)
subplot(211)
plot(t,x);
xlabel('t');
title('original signal')

%% FT
% freq_data_points=10;
% freq_data_points=100;
freq_data_points=length(x);
% freq_data_points=3*length(x);

time_spread=t(end)-t(1);
% w=linspace(-100,100,freq_data_points);
% w=linspace(-1000,1000,freq_data_points);


%%% digital freq Omega=w.dT is periodic from -pi to pi

w=linspace(-pi/dT,pi/dT,length(x));  
% w=linspace(-pi/dT,pi/dT,5*length(x));  
% w=linspace(-pi/dT,pi/dT,15*length(x)); 
% w=linspace(-2*pi/dT,2*pi/dT,length(x));
% w=linspace(-3*pi/dT,3*pi/dT,length(x)+1);
%
dw=w(2)-w(1);
for ii=1:length(w)
    X(ii)=trapz(t,x.*exp(-j*w(ii)*t));
end

% X1=fftshift(fft(x,length(w)))*dT;

%% FS

T=1/f;
w0=2*pi/T; 
k=-10:10;
for ii=1:length(k)
    Ck(ii)=(1/T)*trapz(t, x.*exp(-j*k(ii)*w0*t));
end


w0k=w0*k;
%

figure (2)
subplot(211)
plot(w,abs(X));
xlabel('\omega')
ylabel('|X(\omega)|')
hold on
stem(w0k,abs(Ck)*T,'r')

% hold on
% plot(w,abs(X1),'.');

subplot(212)
plot(w,angle(X));
xlabel('\omega')
ylabel('\angle X(\omega)')
hold on
stem(w0k,angle(Ck),'r')



%% signal reconstruction FT
x_reconstracted=zeros(1,length(t));

for ii=1:length(w)
    x_reconstracted=x_reconstracted+X(ii)*exp(j*w(ii)*t)*dw/2/pi;
end


%
figure(1)
subplot(212)
plot(t,x_reconstracted)
xlabel('t');
title('reconstracted signal')


figure (3)
subplot(211)
plot(w,abs(X),'o-');
xlabel('\omega')
ylabel('|X(\omega)|')
title('numerical FT');
% % discrete angular freq
Omega=w*dT;
subplot(212)
plot(Omega,abs(X));
xlabel('\Omega=\omegadT');
ylabel('|X(\omega)|')
xlim([-3*pi 3*pi]);
set(gca,'xtick',[-3*pi -2*pi -pi 0 pi 2*pi 3*pi],'xticklabels',...
    {'-3\pi','-2\pi','-\pi','0','\pi','2\pi','3\pi'});


