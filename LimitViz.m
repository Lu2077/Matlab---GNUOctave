clear all;
clf; % Limpia el gráfico previo

% 1. Definir un rango de puntos muy cercanos a 0, pero EXCLUYENDO el 0
% Usamos dos rangos: uno que viene por la izquierda y otro por la derecha
%( , ,Cantidad de puntos)
x_izquierda = linspace(-2, 0.9, 100);
x_derecha   = linspace(0.9, 2, 100);
x = [x_izquierda, x_derecha]; % Unimos los puntos

% 2. Calcular la función f(x) = sin(x) / x
% Usamos ./ para que la división se haga elemento por elemento
y = sin(x) ./ x;
%y = 2*x ./ x.^2;
%y = 2*x ./ x-1;

% 3. Graficar la curva de la función
plot(x, y, 'b', 'LineWidth', 2);
hold on;

% 4. Graficar el LÍMITE (el punto al que se aproxima)
% El límite matemático cuando x->0 es 1. Ponemos un marcador rojo en (0,1)
limite_x = 0;
limite_y = 1;
plot(limite_x, limite_y, 'ro', 'MarkerSize', 10, 'LineWidth', 2);

% 5. Estética del gráfico
grid on;
axis([-2, 2, 0, 1.5]); % Centramos la vista alrededor del límite
ax = gca;
ax.XAxisLocation = 'origin'; % Coloca el eje X en el cero real

title('Visualizacion del Limite de f(x) = sin(x)/x cuando x -> 0');
xlabel('Eje X');
ylabel('Eje Y');
legend('f(x) = sin(x)/x', 'Limite = 1', 'Location', 'South');
hold off;
