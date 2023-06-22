
%f=@(t,x) [x(2);-9*x(1)+8*sin(t)]; intervalo=[0,2*pi]; x0=[0,4]; N=1000;

%Oscilador armónico
%k=1; m=1; f=@(t,x) [x(2);-(k/m)*x(1)]; intervalo=[0,10]; x0=[1,0]; N=1000; 
%solexac=@(t) [cos(t), -sin(t)];

%Van der Pol
%a = 1; b = 2; T = 10; x1 = 0.1; x2 = 0.2; f = @(t,x) [x(2); -a*(x(1)^2-b)*x(2) - x(1)]

%11 a)
%f=@(t,x) [-0.1*x(1)+2*x(2); -2*x(1)-0.1*x(2)]; intervalo=[0,10]; x0=[0,1]; N = 1000; 
%solexac=@(t) [exp(-0.1*t).*sin(2*t), exp(-0.1*t).*cos(2*t)];

%11 b)
f=@(t,x) [x(2); cos(3*t)-2*x(1)]; intervalo=[0,10]; x0=[1,0]; N = 1000; 
%solexac=@(t) [cos(sqrt(2)*t)*8/7-cos(3*t)/7, -sin(sqrt(2)*t)*sqrt(2)*8/7+sin(3*t)*3/7];

%Ecuación del péndulo
%m=1; g=9.8; T=10; F=1; L=1; beta=0.25;
%f=@(t,x) [x(2); (F-m*g*sin(x(1))-2*L*beta*x(2))/(m*L)]; intervalo=[0,T]; N=1000; x0=[0.1022,0];

%Péndulo linealizado
%f=@(t, x) [x(2);  (-m*g*x(1) - 2*L*beta*x(2))/(m*L)]; intervalo=[0,T]; N=1000; x0=[pi,0];

