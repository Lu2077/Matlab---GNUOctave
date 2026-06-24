graphics_toolkit("gnuplot");
clear all;
%definir origenes

origen_x = zeros(1,3);
origen_y = zeros(1,3);
origen_z = zeros(1,3);

%2definir componentes
v1 = [2, 2, -3];
v2 = [0, -1, 2];
v3 = [1, -3, 0];

componentes_u = [2, 2, -3];
componentes_v = [0, -1, 2];
componentes_w = [1, -3, 0];

%3graficar con flechas de quiver3
quiver3(origen_x, origen_y, origen_z, componentes_u, componentes_v, componentes_w, 0, 'LineWidth', 3);
%4configurar límites y estetica del gráfico/ploteo
grid on;
axis([-5, 5, -5, 5, -5, 5]);

ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
ax.ZAxisLocation = 'origin';

title('viz de tres vectores 3D');
xlabel('X');
ylabel('Y');
zlabel('Z');
