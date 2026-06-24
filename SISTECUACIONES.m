
clear all;
clf;


pkg load symbolic % Ejecuta esto antes en la consola (requiere tener el comando instalado)
syms x y z

% Defines tu ecuación
ecuacion = x - y + z == 0;

% Criterio: Despejar en función de 'x'
despeje_x = solve(ecuacion, x);
disp("El despeje de x es:"), disp(despeje_x)

% Criterio: Despejar en función de 'y'
despeje_y = solve(ecuacion, y);
disp("El despeje de y es:"), disp(despeje_y)
