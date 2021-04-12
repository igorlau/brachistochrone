function [t] = time_fun(X,Y,N,g)

% Objetive: model the objetive function

% Author: Igor Lau in 08/03/2021

for i = 1:N
    dx(i) = X(i+1) - X(i);
    dy(i) = Y(i+1) - Y(i);
    dydx(i) = dy/dx;
    s(i) = sqrt(Y(i)) + sqrt(Y(i+1));
end

fun = 2*sqrt((dx.^2 + dy.^2))./(sqrt(2*g)*s);

t = sum(fun);
end
