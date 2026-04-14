% Define variables
f1 = 0.2;
f2 = 0.425;
t = 0:0.1:10;
s1 = sin(2*pi*f1*t);
s2 = sin(2*pi*f2*t + 0.4);
s3 = s1 + s2;

% Plot the signals
plot(t, s1, 'b', 'LineWidth', 2);
hold on;
plot(t, s2, 'r', 'LineWidth', 2);
plot(t, s3, 'g', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Amplitude');
legend('s1', 's2', 's3');

%FOr question5, we had to plug and plot 3 graphs using the hold command to
%plot them on the same graph.