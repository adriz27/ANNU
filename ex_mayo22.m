% Examen mayo 2022

f= @(t,x) [x(2); (1-t/2)*x(2)+x(1)];
solexac= @(t) -t.^2 + 4*t - 6;
N = 100;
intervalo = [0,1];
h = 1/N;
t = 0:h:1;
y1 = zeros(2, N+1);
y2 = zeros(2, N+1);
y1(:,1) = [0,4];
y2(:,1) = [1,0];

for i=1:N
   y1(:,i+1) = y1(:,i) + h*f(t(i), y1(:,i)); 
   y2(:,i+1) = y2(:,i) + h*f(t(i), y2(:,i));
end

x = y1(1,:) + (-3-y1(1,100))*y2(1,:)/y2(1,100);
x2 = solexac(t);

figure(1);
plot(t,x,'r');
hold on
plot(t,x2,'b');
legend('Solución numérica','Solución exacta');

error = max(abs(x-x2));
error