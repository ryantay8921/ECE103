omega_value1 = 35;
t =0;
f = @(t)(exp(1.2)*cos(omega_value1*t));
g = @(t)(t^3);
while f(t) && g(t) < 10
    t = t + 0.01;
end
fprintf('Omega = %d, t = %.2f\n', omega_value1, t);


omega_value2 = 40;
t =0;
f = @(t)(exp(1.2)*cos(omega_value2*t));
g = @(t)(t^3);
while f(t) && g(t) < 10
    t = t + 0.01;
end
fprintf('Omega = %d, t = %.2f\n', omega_value2, t);

omega_value3 = 45;
t =0;
f = @(t)(exp(1.2)*cos(omega_value3*t));
g = @(t)(t^3);
while f(t) && g(t) < 10
    t = t + 0.01;
end
fprintf('Omega = %d, t = %.2f\n', omega_value3, t);


