close all
clear all
clc

%% signal definatioan

%define as [u(t+2)*(u(t+1)-u(t-1)]
x=@(t) (t>=-2).*((t>=-1)-(t>=1));

t_single_period=-5:0.1:5;
plot(t_single_period,x(t_single_period))
%now you finished your first part.
%% period and fundamental angular freq.
%2)define dT (step) then T the w0 in the next 3 lines.
dT=t_single_period(2)-t_single_period(1);
 T= dT*(length(t_single_period)-1); % period
w0=2*pi/T; % fundamental angular frequency

%% effectively the question is asking for reconstructing 3 cycles
% of the periodic signal

Nk=51;
% fourier_series_exp() function would plot 3 cycles of the signal
% 3) now define range k for NK=51;
k=-floor(Nk/2):floor(Nk/2)
% if Nk=11, k=-5:5; if Nk=12, k=-6:6
% 4) put the for loop as slide 7 and also you can checkfs_numerical.m ;

for ii=1:length(k)
        Ck(ii)=(1/T)*trapz(t_single_period, x(t_single_period).*exp(-j*k(ii)*w0*t_single_period));
end
        figure 
        subplot(211)
        w0k = w0*k;
% 5) use stem to draw absolute of fourier coefficient Ck ;

        stem(w0k,abs(Ck))
        
        xlabel('w0k')
        ylabel('|C_k|')
        
        w0k = w0*k;
        subplot(2,1,2)
% 6) use s to draw imaginary of fourier coefficient Ck ;

        stem(w0k,angle(Ck)*180/pi);  
        xlabel('w0k')
        ylabel('\angleC_k')
% now you finished part 2        

%7)plot 3 cycles of the signal 'x' and the reconstructed signal
%8)please check after line 28 repmat and other lines
%9) define x_extended
%10) define t_ext
x_ext=repmat(x(t_single_period),1,3);
%         t_ext=t_single_period(1):dT:t_single_period(1)+(3*length(t_single_period)-1)*dT;
      t_ext=linspace(t_single_period(1),t_single_period(1)+(length(x_ext)-1)*...
    (t_single_period(2)-t_single_period(1)),length(x_ext));

%11)slide 9 also you can check line 81 for reconstruction in fs_numerical.
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

% end of part 3
%     