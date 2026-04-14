close all
clear all
clc

%% signal definatioan

%1)define x=@(t) put the function as slide 4 similar to z=@(t).
%define as anonymous function  u(t+2)*[(u(t+1)-u(t-1)]
%x=@(t) ;

t_single_period=-5:0.1:5;
figure (1)
plot(t_single_period,x(t_single_period))
%now you finished your first part.
%% period and fundamental angular freq.
%2)define dT (step) then T the w0 in the next 3 lines.
 % step is already known you can verify it 
 % period
 % fundamental angular frequency

%% Part 2 CK.

Nk=51;
% 3) now define range k for NK=51;

% if Nk=11, k=-5:5; if Nk=12, k=-6:6
% 4) put the for loop as slide 7 and also you can checkfs_numerical.m ;


figure (2)
        subplot(211)
        w0k = w0*k;
% 5) use stem to draw absolute of fourier coefficient Ck ;

        %stem()
        
        xlabel('w0k')
        ylabel('|C_k|')
        
        w0k = w0*k;
        subplot(2,1,2)
% 6) use s to draw imaginary of fourier coefficient Ck ;

        %stem();  
        xlabel('w0k')
        ylabel('\angleC_k')
% now you finished part 2        

%7)plot 3 cycles of the signal 'x' and the reconstructed signal
%8)please check after line 28 repmat and other lines
%9) define x_extended
%10) define t_ext
%x_ext=repmat();
% other solution t_ext=t_single_period(1):dT:t_single_period(1)+(3*length(t_single_period)-1)*dT;
      

%11)slide 9 also you can check line 81 for reconstruction in fs_numerical.

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