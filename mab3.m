function [t,x]=mab3(f,intervalo,x0,N)

r = 3; %numero de pasos
h = (intervalo(2)-intervalo(1))/N;
t = intervalo(1):h:intervalo(2);

[~,x] = meulermej(f,[t(1), t(r)],x0,r-1); %método de inicialización
x = x.';

y = zeros(2, r);
for i=1:r
    y(:, i) = f(t(i), x(:,i));
end

for i=1:N-r+1
    y(:,r) = f(t(i+r-1), x(:,i+r-1));
    x(:,i+r) = x(:,i+2) + h*(23*y(:,3) -16*y(:,2) + 5*y(:,1))/12;
    for j = 1:r-1
        y(:,j) = y(:,j+1);
    end
end
t = t(:);
x = x.';