clear all;
clf;

% Matriz cuyas COLUMNAS son tus vectores del sistema generador
A = [2, 0;  % Vector 1 (columna 1): [2; 1]
     1, 3]; % Vector 2 (columna 2): [0; 3]

% Generar una malla de escalares (coeficientes c1 y c2)
[c1, c2] = meshgrid(-2:0.5:2, -2:0.5:2);

% Operación matricial para generar múltiples vectores en el subespacio
% Cada punto en X e Y es una combinación lineal: c1*v1 + c2*v2
X_subespacio = A(1,1)*c1 + A(1,2)*c2;
Y_subespacio = A(2,1)*c1 + A(2,2)*c2;

% Graficar el subespacio generado (un plano o recta)
mesh(X_subespacio, Y_subespacio, zeros(size(X_subespacio)), 'FaceAlpha', 0.3);
hold on;
% (Luego usas quiver para superponer los vectores columna originales de A)

% 1. Definir los vectores columna en una matriz
V1 = [1; 0; 0];
V2 = [1; 1; 0];
V3 = [0; 1; 2];
A = [V1, V2, V3];

% 2. VALIDACIÓN MATEMÁTICA
if rank(A) == size(A, 2)
    disp('¡Los vectores son linealmente independientes! Forman una BASE.');
    % 3. CÓDIGO DE GRAFICACIÓN (quiver3 usando un bucle para graficar N vectores)
    origenes = zeros(3, size(A, 2));
    quiver3(origenes(1,:), origenes(2,:), origenes(3,:), A(1,:), A(2,:), A(3,:), 0, 'LineWidth', 3);
else
    disp('Los vectores son dependientes. No son una base, el subespacio tiene menor dimensión.');
    % Reducir la matriz para averiguar cuáles sí sirven
    [R, pivotes] = rref(A);
    % Graficar solo los vectores linealmente independientes (las columnas pivote)
end
