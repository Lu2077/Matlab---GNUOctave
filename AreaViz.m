graphics_toolkit("gnuplot");
clear all;

% 1. Definir los puntos del eje X y la función Y
x = linspace(-1, 3, 200);
y = x.^2;

% 2. Graficar la línea de la función
plot(x, y, 'b', 'LineWidth', 2);
hold on;

% 3. Definir e iluminar el área de interés (entre x=0 y x=2)
x_area = linspace(0, 2, 100);
y_area = x_area.^2;
area(x_area, y_area, 'FaceColor', [0.7, 0.85, 1], 'EdgeColor', 'none');

% 4. Detalles estéticos del gráfico
grid on;
xlabel('Eje X');
ylabel('Eje Y');
title('Visualización de Área Bajo la Curva f(x) = x^2');
hold off;
