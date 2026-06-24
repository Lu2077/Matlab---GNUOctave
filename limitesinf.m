clear all;
clf;

% 1. Puntos que se acercan a 1 (rango visible para la pantalla)
x_izquierda = linspace(0.5, 0.8, 50);   % Se detiene en 0.8 (f(0.8) = -8)
x_derecha   = linspace(1.5, 1.2, 50);   % Se detiene en 1.2 (f(1.2) = 12)
x = [x_izquierda, x_derecha];

% 2. Calcular la función
y = (2*x) ./ (x - 1);

% 3. Graficar la curva principal
plot(x, y, 'b', 'LineWidth', 2);
hold on;

% 4. Graficar los puntos de aproximación (¡Ahora sí están en rango!)
y_izq_limite = (2 * 0.8) / (0.8 - 1);  % Da -8
y_der_limite = (2 * 1.2) / (1.2 - 1);  % Da 12

plot(0.8, y_izq_limite, 'ro', 'MarkerSize', 9, 'MarkerFaceColor', 'r');
plot(1.2, y_der_limite, 'ro', 'MarkerSize', 9, 'MarkerFaceColor', 'r');

% 5. Ajustar una escala perfecta para el ojo humano
grid on;
axis([0.4, 1.6, -20, 25]);

ax = gca;
ax.XAxisLocation = 'origin';
title('Aproximacion Visible al Limite de f(x) = 2x / (x-1)');
xlabel('Eje X');
ylabel('Eje Y');
legend('f(x)', 'Puntos de Evaluacion', 'Location', 'NorthEast');
hold off;

