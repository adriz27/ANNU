function [t,x]=mmilne4bdf5(f,intervalo,x0,N)

r = 4; %numero de pasos
h = (intervalo(2)-intervalo(1))/N;
t = intervalo(1):h:intervalo(2);

[~,x] = mrk4(f,[t(1), t(r)],x0,r); %método de inicialización
x = x.';

y = zeros(2, r);
for i=1:r
    y(:, i) = f(t(i+1), x(:,i+1));
end

for i=1:N-r
    %P
    x(:,i+5) = x(:,i+1) + 4*h*(2*y(:,4) -y(:,3) +2*y(:,2))/3;
    %E
    fir = f(t(i+5), x(:,i+5));
    %C
    x(:,i+5) = (fir*h*60 +300*x(:,i+4) -300*x(:,i+3) +200*x(:,i+2) -75*x(:,i+1) +12*x(:,i))/137;
    %E
    for j = 1:r-1
        y(:,j) = y(:,j+1);
    end
    y(:,r) = f(t(i+5), x(:,i+5));
end
t = t(:);
x = x.';