t = linspace(0, 1, 15);
x = 4*cos(2*pi*t + 0.2) + 3*sin((pi^2)*t);

max_x = max(x);
min_x = min(x);
mean_x = mean(x);
indices = find(abs(x) > 4);

disp(['Maximum element value: ', num2str(max_x)]);
disp(['Minimum element value: ', num2str(min_x)]);
disp(['Average of the element values: ', num2str(mean_x)]);
disp(['Indices of the elements for which the magnitude is greater than 4: ', num2str(indices)]);
