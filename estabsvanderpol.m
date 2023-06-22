% 2 Hoja 5
alfa = .1; T = 150;

beta = 1; ji0 = 0.1; eta0 = 0.1; 
x0 = [ji0, eta0];
f=@(t,x) [x(2); -alfa*(x(1)^2 - beta)*x(2) - x(1)];
intervalo = [0, T];

opciones = odeset('Stats','off','AbsTol',1.e-5,'RelTol',1.e-5);
[t1,x1]=ode45(f,intervalo,x0,opciones);
t = t1; x = x1; graficas;

[t2,x2]=ode15s(f,intervalo,x0,opciones);
t = t2; x = x2; graficas;

pasos1 = diff(t1); pasos2 = diff(t2);

figure(3)
hold on
plot(pasos1,'r')
plot(pasos2,'b')
s=sprintf('Londitud de paso');
l1=sprintf('ode45 (%d pasos)', length(pasos1));
l2=sprintf('ode15s (%d pasos)', length(pasos2));
title(s)
legend(l1, l2)

