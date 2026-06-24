clear all;
clf;


pkg load symbolic % Ejecuta esto antes en la consola (requiere tener el comando instalado)
syms x y z a b c

% Defines tu ecuación
eq1 = 2*a - 4*b + c == x;
eq2 = b + c == y;
eq3 = a == z;

sol = solve([eq1, eq2, eq3], [a, b, c]);

disp("---SOL---")
fprintf("a = %s\n", char(sol.a));
fprintf("b = %s\n", char(sol.b));
fprintf("c = %s\n", char(sol.c));

