% Define the MySinc() function as an anonymous function
MySinc = @(x) (x == 0) + (x ~= 0) .* sin(x)./x;

% Generate the plot
x = linspace(-2*pi, 2*pi, 1000); % Generate 1000 points between -2pi and 2pi


y1 = arrayfun(MySinc, x); % Compute the values of MySinc() for all the points
y2 = sinc(x); % Compute the values of MATLAB's sinc() function for all the points


plot(x, y1, 'r', x, y2, 'b--', 'LineWidth', 2); % Plot both functions with different line styles
xlabel('x');
ylabel('sinc(x)');
legend('MySinc', 'MATLAB sinc');
title('Comparison of MySinc() and MATLAB sinc() functions');

%For question6, I had to create an anonomous function that can will plot
%the sinc function.  Then plot both from -2pi to 2pi