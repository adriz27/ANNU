function [t,x]=mab2(f,intervalo,x0,N)

% pasos = 2;
h = (intervalo(2)-intervalo(1))/N;
t = intervalo(1):h:intervalo(2);
x = zeros(size(x0, 2), N);
x(:,1) = x0(:);
x(:,2) = x0(:) + h* f(t(1), x0(:));%método de inicialización

y(:, 1) = f(t(1), x(:,1));
for i=1:N-1
    y(:, 2) = f(t(i+1), x(:, i+1));
    x(:,i+2) = x(:, i+1) + 0.5*h*(3*y(:, 2) - y(:, 1));
    y(:, 1) = y(:, 2);
end
t = t(:);
x = x.';