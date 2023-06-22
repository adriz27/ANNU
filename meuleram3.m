function [t,x]=meuleram3(f,intervalo,x0,N)
%   P(EC)^mE
r = 3; %numero de pasos
h = (intervalo(2)-intervalo(1))/N;
t = intervalo(1):h:intervalo(2);
m = 3;

[~,x] = mrk3(f,[t(1), t(r)],x0,r-1); %método de inicialización
x = x.';

y = zeros(2, r);
for i=1:r
    y(:, i) = f(t(i), x(:,i));
end

for i=1:N-r+1
    %P
    x(:,i+r) = x(:,i+2) + h*y(:,3);
    for j=1:m   
        %E
        fir = f(t(i+r), x(:,i+r));
        %C
        x(:,i+r) = x(:,i+2) + (9*fir +19*y(:,3) -5*y(:,2) +y(:,1))*h/24;
    end
    %E
    for j = 1:r-1
        y(:,j) = y(:,j+1);
    end
    y(:,r) = f(t(i+r), x(:,i+r));
end
t = t(:);
x = x.';