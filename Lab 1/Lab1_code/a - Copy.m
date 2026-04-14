% Create the vector x
x = 1:100;

% Find the even numbers in x and assign them to a new vector y
y = x(mod(x, 2) == 0);

% Print the vectors x and y
%disp(x)
%disp(y)