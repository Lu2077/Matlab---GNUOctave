graphics_toolkit("gnuplot");
clf;
clear all;

%definir dos vectores en el plano
v1 = [3; 1; -2];
v2 = [1; -2; 1];

%crear parametros en el espacio para combinaciones lineales
[a, b] = meshgrid(-5:1:5, -5:1:5);

%computar los puntos en el subespacio
X = a * v1(1) + b * v2(1);
Y = a * v1(2) + b * v2(2);
Z = a * v1(3) + b * v2(3);

%plotear el plano
figure;
surf(X, Y, Z, 'facecolor', 'cyan', 'EdgeColor', 'blue', 'FaceAlpha', 0.5);
hold on;

%plotear los vectores en el subespacio
quiver3(0, 0, 0, v1(1), v2(2), v1(3), 'r', 'LineWidth', 2);
quiver3(0, 0, 0, v2(1), v2(2), v2(3), 'b', 'LineWidth', 2);

grid on;
axis equal
view(3); %rotar para una visualización 3D
xlabel('X');
ylabel('Y');
zlabel('Z');
title('visualización de un subespacio en 3D');
