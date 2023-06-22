% Examen Mayo 2018

f= @(t,x) x + cos(t);
x0 = 1;
intervalo = [0, pi];
N = 100;
h = pi/N;
t = intervalo(1):h:intervalo(2);
x = zeros(1,N+1);
x(:,1) = x0;

for i=1:N
   x(:,i+1) = (x(:,i) + h*(x(:,i)+cos(t(i))+2*cos(t(i+1)))/3)/(1-2*h/3); 
end

figure(1);
plot(t,x,'r');