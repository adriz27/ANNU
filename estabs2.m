%1 Hoja 5
mu = 50; f=@(t,x) -mu*(x-cos(t)); intervalo = [0,1]; x0 = 0;
solexac=@(t) (mu^2/(1+mu^2))*(cos(t) - exp(-mu*t) + sin(t)/mu);

N1= 24;
h1 = (intervalo(2)-intervalo(1))/N1;
t1 = intervalo(1):h1:intervalo(2);
x1 = zeros(1, N1);
x1(1) = x0;
for i=1:N1
    x1(i+1) = ( x1(i) + h1*mu*cos(t1(i+1)) )/(1+mu*h1);
end
t1 = t1(:);
x1 = x1.';

N2= 26;
h2 = (intervalo(2)-intervalo(1))/N2;
t2 = intervalo(1):h2:intervalo(2);
x2 = zeros(1, N2);
x2(1) = x0;
for i=1:N2
    x2(i+1) = ( x2(i) + h2*mu*cos(t2(i+1)) )/(1+mu*h2);
end
t2 = t2(:);
x2 = x2.';


color=['r','b','g'];
figure(1)
plot(t1,x1,color(1))
hold on
plot(t2,x2,color(2))
fplot(solexac, intervalo)