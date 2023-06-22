%1 Hoja 5
mu = 50; f=@(t,x) -mu*(x-cos(t)); intervalo = [0,1]; N = 24; x0 = 0;
solexac=@(t) (mu^2/(1+mu^2))*(cos(t) - exp(-mu*t) + sin(t)/mu);
[t1, x1] = meuler(f,intervalo,x0,24);
[t2, x2] = meuler(f,intervalo,x0,26);

color=['r','b','g'];
figure(1)
plot(t1,x1,color(1))
hold on
plot(t2,x2,color(2))
fplot(solexac, intervalo)


