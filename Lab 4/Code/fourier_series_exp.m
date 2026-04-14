%PROBLEM 1

% Ck = exponential fourier series cofficient
% x = single period of a signal
% t = time corrosponding to 'x'
% Nk = (optional input) number of exponential terms
% p = plotting option ; p=0, no plots, p = 1 plot Ck vs k and reconstructed signal
% dT = t(2)-t(1) = temporal resolution of signal (x)
% T = peiod of signal 'x'
% w0= angular frequency of signal 'x'


function [Ck]=fourier_series_exp(x,t,Nk,p)
% Check the number of inputs, 'nargin' returns number of input arguments
    if nargin <2
        error('Not enough input argument!')
    elseif nargin == 2
        Nk=101; % you can set any default value you like
        p=0; % not plots
    elseif nargin ==3
        p=0; % not plots
    end
    k=-floor(Nk/2):floor(Nk/2); % if Nk=11, k=-5:5; if Nk=12, k=-6:6

    dT=t(2)-t(1);
    T= dT*length(t);
    w0=2*pi/T;
    w0k = w0*k;

%% evaluate Ck
    Ck=zeros(1,length(k));
    for ii = 1:length(k)
        %Ck(ii) = (1/T)*(trapz(t,(x.*exp(-1i*w0*k(ii)*t))));
        Ck(ii)=sum(x.*exp(-1i*k(ii)*w0*t)*dT)/T;
    end   
%% plot spectrum and reconstructed signal   
    if p==1
% plot abs(Ck) vs k and angle(Ck) vs k
        figure(1)
        subplot(211)
        stem(w0k,abs(Ck),'b')
        xlabel('K')
        ylabel('|Ck|')
        title('Amplitude Spectrum')
% Plot single-sided amplitude spectrum.
        subplot(212)
        stem(w0k,angle(Ck)*(180/pi),'g')
        xlabel('K')
        ylabel('<Ck>')
        title('Phase Spectrum')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        t_r = linspace(-5,3*T,3*length(t));
        x_x = [x x x];
        x_recon = zeros(1,length(t_r));
        for ii=1:length(k)
            x_recon = x_recon + Ck(ii) * exp(1i*k(ii)*w0*t_r);
        end

        figure(2)

        subplot(2,1,1)
        plot(t_r,x_x,'r')
        xlabel('t')
        ylabel('x(t)')
        title('signal x(t)')

        subplot(2,1,2)
        plot(t_r, real(x_recon))
        xlabel('t')
        ylabel('x(t)')
        title('Reconstructed Signal')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    else
        disp('No Plots')
    end

end