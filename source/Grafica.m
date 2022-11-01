% ESTE SCRIPT GRAFICA LA FUNCIÓN DE INTERÉS OTENIDA DEL SIGUIENTE ARTÍCULO:

% Jamil, M., & Yang, X. S. (2013). A literature survey of benchmark functions for global
% optimisation problems. International Journal of Mathematical Modelling and
% Numerical Optimisation, 4(2), 150-194

clear;
close all;
clc;

%Definiendo el espacio de búsqueda (Dado en el artículo )
x1min=0; x1max=10;
x2min=0; x2max=10;

%Discretizando 
deltaxx=0.1;
x1r=x1min:deltaxx:x1max;
x2r=x2min:deltaxx:x2max;

% Malla de valores en X y Y para evaluar la función:
[X,X2] = meshgrid(x1r,x2r);

%Función ALPINE 2 modificada para hallar el mínimo (multiplicada por -1).
Z= -1.0* X.^(1/2).* sin(X) .* X2.^(1/2).* sin(X2);
 
 
%REALIZANDO LA GRÁFICA
%figure(1)
h = figure();
subplot(1,2,1)
surfc(X,X2,Z)
grid on, title('\bf f(x,y)'); shading interp;
xlabel('\bf X'), ylabel('\bf Y'), zlabel('\bf Z');
minz=min(min(Z));
maxz=max(max(Z));
axis([x1min x1max x2min x2max]);
set(gca, 'FontSize', 16)
axis('square')

subplot(1,2,2)
pcolor(X,X2,Z);
grid on, title('\bf f(x,y)'); shading interp;
xlabel('\bf X'), ylabel('\bf Y'), zlabel('\bf Z');
axis([x1min x1max x2min x2max ]);

escala=linspace(min(min(Z)), max(max(Z)) ,11);
colorbar("yticklabel", escala,'ytick', escala, 'Fontsize', 12);
set(gca, 'FontSize', 16)
axis('square')

%figure(2)
%surface(X,X2,Z),shading interp;
