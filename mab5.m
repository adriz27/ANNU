function [t,x]=mab5(f,intervalo,x0,N)

r = 5; %numero de pasos
h = (intervalo(2)-intervalo(1))/N;
t = intervalo(1):h:intervalo(2);

[~,x] = mrk4(f,[t(1), t(r)],x0,r-1); %método de inicialización
x = x.';

y = zeros(2, r);
for i=1:r
    y(:, i) = f(t(i), x(:,i));
end

for i=1:N-r+1
    y(:,r) = f(t(i+r-1), x(:,i+r-1));
    x(:,i+r) = x(:,i+4) + h*(1901*y(:,5) -2774*y(:,4) +2616*y(:,3) -1274*y(:,2) +251*y(:, 1))/720;
    for j = 1:r-1
        y(:,j) = y(:,j+1);
    end
end
t = t(:);
x = x.';