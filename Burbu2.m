clc; clear all; close all;
N=25;
v=abs(ceil(rand(1,N)*N  ));
v1=v;
bar(v)
%pause(1)
intercambio=1;
% config sonido
ts=1/8000;
N1=5000;
T=N1*ts;
parada=T*(1-1/N1);
t=0:ts:parada;
%fin sonido
tic
while intercambio~=0
    intercambio=0;
    for i=1:N-1
        [v(i) v(i+1)]
        if v(i) > v(i+1)
            aux=v(i);
            v(i) =v(i+1);
            v(i+1)=aux;
            intercambio=intercambio+1;
            figure(2);
            b=bar(v);
            %pause(0.1)
        end
        
        %pause(0.1)
    end

end
b=bar(v);
toc