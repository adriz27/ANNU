function [t,x]=mab4am4(f,intervalo,x0,N)

r = 4; %numero de pasos
h = (intervalo(2)-intervalo(1))/N;
t = intervalo(1):h:intervalo(2);

[~,x] = mrk4(f,[t(1), t(r)],x0,r-1); %método de inicialización
x = x.';

y = zeros(2, r);
for i=1:r
    y(:, i) = f(t(i), x(:,i));
end

for i=1:N-r+1
    %P
    x(:,i+r) = x(:,i+3) + h*(55*y(:,4) -59*y(:,3) + 37*y(:,2) - 9*y(:, 1))/24;  
    %E
    fir = f(t(i+r), x(:,i+r));
    %C
    x(:,i+r) = x(:,i+3) + (251*fir +646*y(:,4) -264*y(:,3) +106*y(:,2) -19*y(:,1))*h/720;
    %E
    for j = 1:r-1
        y(:,j) = y(:,j+1);
    end
    y(:,r) = f(t(i+r), x(:,i+r));
end
t = t(:);
x = x.';