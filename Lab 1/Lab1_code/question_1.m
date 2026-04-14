% Create the vector x containing integers from 1 to 100
x = 1:100;

% Find the even numbers in x and assign them to a new vector y
% The "mod" function returns the remainder when x is divided by 2.
% If the remainder is 0, then the number is even.
% The expression "mod(x, 2) == 0" creates a logical vector that is "true" for even numbers and "false" for odd numbers.
y = x(mod(x, 2) == 0);

% Print the vector y in the Command Window
% The "disp" function is used to display the value of a variable or expression.
plot(y,x)