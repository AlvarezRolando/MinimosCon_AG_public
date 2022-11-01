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
h = figure(1);
minz=(min(Z)); %Para las etiquetas de los ejes 
maxz=(max(Z)); %Para las etiquetas de los ejes 

subplot(1,2,1)
surf (X,X2,Z) %Vista 3D
grid on, title('z = - \surd{x} sen(x) * \surd{y} sen(y)  '); shading interp;
xlabel('\bf x'), ylabel('\bf y'), zlabel('\bf z');
axis([x1min x1max x2min x2max]);
axis('square')

subplot(1,2,2)
pcolor(X,X2,Z); %Vista de planta, gráfica de la derecha 
grid on, title('z = - \surd{x} sen(x) * \surd{y} sen(y)'); shading interp;
xlabel('\bf x'), ylabel('\bf y'), zlabel('\bf z');
axis([x1min x1max x2min x2max ]);
axis('square')

%Propiedades del colorbar 
escala=linspace(min(min(Z)), max(max(Z)) ,8); %Límites y numéro de etiquetas 
colorbar("yticklabel", escala,'ytick', escala, 'Fontsize', 9); 

%Se guarda la imagen de la función Alpine 
%Nota, se tuvo que ingresar la ruta completa (será distinta en Windows)
print (h,'-dpng', '/media/rolio/Disco Local/Documentos/Portafolio/MinimosCon_AG_public/img/Alpine2.png');

