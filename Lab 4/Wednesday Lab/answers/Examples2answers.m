close all
clear all
clc

%% signal defination
x=@(t)t-10j*pi*t.^4;
t_single_period=0:0.01:5;
plot(t_single_period,x(t_single_period))
%% period and fundamental angular freq.
dT=t_single_period(2)-t_single_period(1);
T= dT*(length(t_single_period)-1); % period
w0=2*pi/T; % fundamental angular frequency

%% effectively the question is asking for reconstructing 3 cycles
% of the periodic signal
t_reconstruction=0:0.01:25; 

Nk=51;
p=1; % fourier_series_exp() function would plot 3 cycles of the signal
% C_k=fourier_series_exp(x(t_single_period),t_single_period,Nk,p);
t=t_single_period;

    dT=t(2)-t(1);
    T= dT*length(t);
    w0=2*pi/T;   

k=-floor(Nk/2):floor(Nk/2)% if Nk=11, k=-5:5; if Nk=12, k=-6:6
k
for ii=1:length(k)
        Ck(ii)=(1/T)*trapz(t, x(t_single_period).*exp(-j*k(ii)*w0*t));
end
        figure 
        subplot(211)
        w0k = w0*k;
      stem(w0k,abs(Ck))
        xlabel('w0k')
        ylabel('|C_k|')
        
        subplot(2,1,2)
        stem(w0k,angle(Ck)*180/pi);  
        xlabel('w0k')
        ylabel('\angleC_k')
        
% plot 3 cycles of the signal 'x' and the reconstructed signal
        x_ext=repmat(x(t_single_period),1,3);
        t_ext=t(1):dT:t(1)+(3*length(t)-1)*dT;
      x_reconstructed=zeros(size(t_ext));
        for ii=1:length(k)
            x_reconstructed=x_reconstructed+Ck(ii)*exp(j*k(ii)*w0*t_ext);
        end
        figure
        subplot(211)
        plot(t_ext,x_ext)
        xlabel('t');
        title('original signal')
        subplot(2,1,2)
        plot(t_ext,x_reconstructed)
        xlabel('t');
        title('reconstructed signal')

        figure
     subplot(211)
        plot(t_ext,abs(x_ext))
        hold on
        plot(t_ext,abs(x_reconstructed))
        xlabel('t');
        legend('original absolute','reconstructed absolute')
subplot(212)
plot(t_ext,imag(x_ext))
        hold on
        plot(t_ext,imag(x_reconstructed))
        xlabel('t');
        legend('original imaginary','reconstructed imaginary')









% %% the function plot the reconstructed signal for us. Let's manually plot
% % three (3) cycles again
% 
% figure
% 
% x_reconstructed=zeros(size(t_reconstruction));
% k=-floor(length(C_k)/2):floor(length(C_k)/2);
% 
% for ii=1:length(C_k)
%     x_reconstructed=x_reconstructed+C_k(ii)*exp(j*k(ii)*w0*t_reconstruction);
% end
% 
% % subplot(2,1,1)
% plot(t_reconstruction,x_reconstructed)
% xlabel('t');
% title('reconstructed signal')
% 
%     