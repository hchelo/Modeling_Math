% Metodo Montecarlo
% MrRoboto
clear all, clc, close all
Rn=500; % # de veces de un numero randomico dentro un circulo
NCirculo=[]; % Conteo de # de veces que el punto aterriza sobre el circulo

%% Dibujando el circulo inscrito en un cuadrado
figure(1)
clf; %limpiar figura
syms C % Creando unavariable simbolica
x=cos(C);
y=sin(C);
R=[0 2*pi] % definiendo el rango
subplot(211)
h=ezplot(x,y,[R]); % grafico de las funciones
set(h,'Color','c','LineWidth',1)
axis([-1 1 -1 1])
hold on

subplot(212);
line([0 Rn],[pi pi],'Color','red','linewidth',2)
hold on
%% Comenzando iteracion
a=-1;
b=1;
pause
for t=1:Rn % generando Rn puntos aletorios dentro un cuadrado de 2x2 con un punto centrado
  Xn=a+(b-a).*rand(1);
  Yn=a+(b-a).*rand(1);
  dist_n(t)= Xn^2 + Yn^2; % Radio del circulo
  figure(1)
  % graficando los puntos
  subplot(211)
  plot(Xn,Yn,'.r','markersize',5); 
  
  % Contando los puntos que caen dentro del circulo
  NCirculo(t)= sum(dist_n(1:t) <=1);
  
  % Calculando la estimacion de PI
  est_pi=4 * NCirculo(1:t)./(1:t)
  
  % Graficando la estimacion de PI
  subplot(212);
  plot(est_pi,'.-k','linewidth',2,'markersize',4);
  title( ['N = ', num2str(t),' Estimacion de PI = ', num2str(est_pi(end))] );
  ylabel(' Estimacion de PI ');
  xlabel(' Iteracion ')
  %pause(1)  
      
end    

hold off
