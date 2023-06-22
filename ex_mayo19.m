% Examen mayo 2019

f= @(t,x) [x(2); 4*(t.^2)*x(1)+2*exp(t.^2)];
solexac = @(t) exp(t.^2);
intervalo = [0,1];
N = 100;
h = 1/N;
t = intervalo(1):h:intervalo(2);
x = zeros(2, N+1);
x0 = [1,0];
x(:,1) = x0;

for i=1:N
   F1 = f(t(i), x(:,i));
   F2 = f(t(i+1), x(:,i)+h*F1);
   x(:,i+1) = x(:,i) + h*(F1 + F2)/2;
end

x2 = solexac(t);
figure(1);
hold on
plot(t, x(1,:), 'r');
plot(t, x2, 'b');
legend('Solución numérica','Solución exacta');

max(abs(x(1,:)-x2))