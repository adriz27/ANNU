% Examen Julio 2018
f= @(t,x) -2*(x - 3);
x0 = 2;
solexac = @(t) 3 - exp(-2*t);
intervalo = [0,1];
N = 200;
x = zeros(1,N+1);
x(:,1)= x0;
h = 1/N;
t = intervalo(1):h:intervalo(2);

% Inicialización
fi = f(t(1), x(:,1));
x(:,2) = x(:,1) + h*fi;
fi1 = f(t(2), x(:,2));

for i=1:N-1
   % P
   x(:,i+2) = x(:,i+1) + h*fi1;
   % E
   fi2 = f(t(i+2), x(:,i+2));
   % C
   x(:,i+2) = x(:,i+1) + h*(5*fi2 + 8*fi1 - fi)/12;
   % E
   fi = fi1;
   fi1 = f(t(i+2), x(:,i+2));
end

figure(1);
plot(t,x, 'r');
hold on
x2 = solexac(t);
plot(t, x2, 'b');

maxError = max(abs(x - x2));
maxError
