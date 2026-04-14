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
        result(i,j) = 3*cos(2*pi*f*t);
    end
end

% Print the results
disp(result);


%For problem 2, we had to use a nested for loop to solve a function
%with two unkowns.