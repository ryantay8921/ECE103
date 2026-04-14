% Define the values of t and f to compute
t_values = [0, 0.1, 0.2, 0.3, 0.4];
f_values = [10, 15, 20];

% Initialize the result array
result = zeros(length(t_values), length(f_values));

% Loop over t and f values
for i = 1:length(t_values)
    for j = 1:length(f_values)
        t = t_values(i);
        f = f_values(j);
        result(i,j) = sin(2*pi*f*t);
    end
end

% Print the results
disp(result);