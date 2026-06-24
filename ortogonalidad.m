graphics_toolkit("gnuplot");
clear all;
clf;

% 1. DEFINE AQUÍ TUS DOS VECTORES (pueden ser de 2D o 3D)
% Ejemplo ortogonal: v1 = [3, 0, 0] y v2 = [0, 4, 0]
v1 = [2, 2, -1];
v2 = [1, -1,  0];

% 2. VALIDACIÓN MATEMÁTICA: Producto Punto
prod_punto = dot(v1, v2);

% Tolerancia para errores de punto flotante en la computadora
if abs(prod_punto) < 1e-9
    es_ortogonal = true;
    fprintf('¡Vectores ORTOGONALES!: El producto punto es 0.\n');
else
    es_ortogonal = false;
    % Calcular el ángulo real para informar al usuario
    angulo = acos(dot(v1,v2)/(norm(v1)*norm(v2))) * (180/pi);
    fprintf('No son ortogonales. Producto punto = %.2f (Ángulo = %.1f°).\n', prod_punto, angulo);
end

% 3. Preparar datos para quiver3 (orígenes y componentes)
origenes = zeros(1, 3);

% 4. Graficar los vectores
% Vector 1 (Azul)
quiver3(0, 0, 0, v1(1), v1(2), v1(3), 0, 'b', 'LineWidth', 3);
hold on;
% Vector 2 (Rojo)
quiver3(0, 0, 0, v2(1), v2(2), v2(3), 0, 'r', 'LineWidth', 3);

% 5. Si son ortogonales, dibujar una malla que represente el plano generado por ambos
if es_ortogonal
    [c1, c2] = meshgrid(-1:0.2:1, -1:0.2:1);
    X_plano = c1*v1(1) + c2*v2(1);
    Y_plano = c1*v1(2) + c2*v2(2);
    Z_plano = c1*v1(3) + c2*v2(3);
    mesh(X_plano, Y_plano, Z_plano, 'FaceColor', 'cyan', 'FaceAlpha', 0.2, 'EdgeAlpha', 0.3);
    title('Visualización de Vectores Ortogonales y su Plano');
else
    title('Visualización de Vectores No Ortogonales');
end

% 6. Estética y CRÍTICO: axis equal para que los 90° se vean reales
grid on;
axis([-4, 4, -4, 4, -4, 4]);
axis equal; % Evita la distorsión geométrica de los ejes

ax = gca;
ax.XAxisLocation = 'origin'; ax.YAxisLocation = 'origin'; ax.ZAxisLocation = 'origin';
xlabel('X'); ylabel('Y'); zlabel('Z');
legend('Vector v1', 'Vector v2', 'Plano Ortogonal');
hold off;
