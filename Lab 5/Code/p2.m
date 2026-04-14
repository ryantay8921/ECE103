%Problem 2
clc;close all;clear all;

%--------------------------------------------------------------------------
%PART A
%--------------------------------------------------------------------------

% Define the frequency range
omega = -31.4:0.01:31.4;
%define time range
t = -100:0.1:100;

%----------------------------Function---------------------------------------
%Define the input g(t)
G = @(omega) (2).*(abs(omega)<=10 & abs(omega)>=5);
g = @(t) (1/(2*pi))*(integral(@(omega) G(omega).*exp(1i*omega*t),-Inf, Inf));

% Define the filter H(ω)
H = @(omega) (5*abs(omega)).*(abs(omega)<=20);
% Calculate the frequency domain output signal M(ω)

%M = conv(H(omega), inverseFT) ;
M = G(omega).*H(omega);
M = M(1:length(omega));

%-----------------------------Plotting-------------------------------------

% Plot the magnitude and phase of M(ω)
subplot(2, 2, 1);
plot(omega, abs(M));
title('Magnitude of M(\omega)');
xlabel('\omega');
ylabel('|M(\omega)|');

subplot(2, 2, 3);
plot(omega, angle(M));
title('Phase of M(\omega)');
xlabel('\omega');
ylabel('Phase(M(\omega))');

%--------------------------------------------------------------------------
%PART B
%--------------------------------------------------------------------------


%----------------------------Function---------------------------------------
%Inverse FT of m(w)
k=0;
for t=-100:0.1:100
    k=k+1;
    m_t(k)=trapz(omega,M.*exp(1i*omega*t));
end
m_t=m_t/(2*pi);
t=-100:0.1:100;
%-----------------------------Plotting-------------------------------------

% Plot Re(m(t)) and Im(m(t)) in a 2x1 subplot
subplot(2, 2, 2);
plot(t, real(m_t));
title('Real part of m(t)');
xlabel('t');
ylabel('Re(m(t))');

subplot(2, 2, 4);
plot(t, imag(m_t));
title('Imaginary part of m(t)');
xlabel('t');
ylabel('Im(m(t))');



% Calculate the energy of the output signal m(t) in the time domain
energy_time_domain=trapz(t,(abs(m_t)).^2);
disp("Energy in the time domain: " + energy_time_domain);
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
% Evaluate the energy of the output signal in the frequency domain using Parseval's theorem
energy_frequency_domain=(1/(2*pi))*(trapz(omega,(abs(M)).^2));
disp("Energy in the frequency domain: " + energy_frequency_domain);
%--------------------------------------------------------------------------























