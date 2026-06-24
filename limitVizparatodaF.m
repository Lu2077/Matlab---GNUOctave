clear all;
clf;

% =========================================================================
% CONFIGURACIÓN GENERAL: Configura aquí tu problema
% =========================================================================
c = 0;                  % El punto al que tiende el límite (ej. x -> 0)
limite_analitico = 1;   % El resultado teórico del límite para el marcador

% DEFINE AQUÍ TU FUNCIÓN usando una función anónima @(x)
% (Recuerda usar siempre los puntos .^ , .* , ./ )
%f = @(x) sin(x) ./ x; %usar la estructura %f = @(x) ...etc
%f = @(x) x.^2 - 4.*x + 1 ./ 4;
f = @(x) (x.^2 - 4) ./ (x - 2);
% =========================================================================

% 1. Rango seguro para graficar la curva (esquivando el punto crítico)
x_izq = linspace(c - 2, c - 0.01, 100);
x_der = linspace(c + 0.01, c + 2, 100);
x_curva = [x_izq, x_der];
y_curva = f(x_curva);

% 2. EVALUACIÓN CRÍTICA: Forzamos a Octave a calcular el punto exacto 'c'
% Aquí es donde se generará el NaN o Inf si la función es indeterminada
y_critico = f(c);

% 3. Graficar el comportamiento general de la función
plot(x_curva, y_curva, 'b', 'LineWidth', 2);
hold on;

% 4. BLOQUE DE DETECCIÓN AUTOMÁTICA DE INDETERMINACIÓN
if isnan(y_critico)
    % CASO 1: Indeterminación tipo 0/0 (Pinta un círculo abierto/vacío)
    fprintf('¡ALERTA!: Se detectó una indeterminación del tipo [0/0] en x = %d.\n', c);
    plot(c, limite_analitico, 'ro', 'MarkerSize', 10, 'LineWidth', 2, 'MarkerFaceColor', 'w');
    text(c + 0.1, limite_analitico, ' <- Indeterminación (Agujero Evitable)', 'Color', 'r');

elseif isinf(y_critico)
    % CASO 2: Indeterminación tipo k/0 (Disparo al infinito)
    fprintf('¡ALERTA!: Se detectó una asíntota/disparo al infinito [k/0] en x = %d.\n', c);
    % Dibuja una línea vertical punteada roja para marcar la asíntota
    line([c, c], [min(y_curva), max(y_curva)], 'Color', 'r', 'LineStyle', '--', 'LineWidth', 1.5);
    text(c + 0.1, (max(y_curva)+min(y_curva))/2, ' <- Asíntota Vertical', 'Color', 'r');

else
    % CASO 3: La función es continua (No hay indeterminación)
    fprintf('La función es continua en x = %d. f(%d) = %f\n', c, c, y_critico);
    plot(c, y_critico, 'ro', 'MarkerSize', 10, 'LineWidth', 2, 'MarkerFaceColor', 'r');
end

% 5. Estética y límites adaptativos
grid on;
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
title(['Análisis de Límite en x -> ' num2onestr(c)]);
xlabel('X'); ylabel('Y');
hold off;
