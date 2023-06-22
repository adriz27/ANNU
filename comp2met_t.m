function comp2met_t(met1, met2, n)
datos;
nn = 1:n;
T = zeros(2, n);
for i=1:n
    tic;
    [~,~] = met1(f,intervalo,x0,N);
    T(1,i) = toc;

    tic;
    [~,~] = met2(f,intervalo,x0,N);
    T(2,i) = toc;
end
figure(1)
plot(nn, T(1,:), 'r')
hold on
plot(nn, T(2,:), 'b')
title("Tiempo de ejecución")

for i=2:n
    T(:,i) = T(:,i) + T(:,i-1);
end

figure(2)
plot(nn, T(1,:), 'r')
hold on
plot(nn, T(2,:), 'b')
title("Tiempo de ejecución acumulado")