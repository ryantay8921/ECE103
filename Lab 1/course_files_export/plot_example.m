close all
clear all
clc

x=1:5:360; 

a=sind(x);
b=cosd(x);


plot(x,a);
hold on
plot(x,b);
xlabel('x');
legend('sind(x)','cosd(x)');

%%
% for ii=1:length(x)
%     [s1(ii) s2(ii)]= add_sub(a(ii),b(ii));
% end
% 
% figure (3)
% 
% subplot(211)
% plot(x,s1);
% xlabel('x');
% ylabel('s1')
% 
% subplot(212)
% plot(x,s2);
% xlabel('x');
% ylabel('s2')


