% Marcelo Saavedra Boy born Tuesday problem
clc; clear all; close all
N=10000   % Numero de Familias
Sol=13/27; %0.4815
figure(1)
line([0 N],[Sol Sol],'Color','red','linewidth',2)
hold on


for i=1:N
    sex1=randi(2,N,1);  % sexo bebe 1
    sex2=randi(2,N,1);  % sexo bebe 2
    day1=randi(7,N,1);  % Dia nacimiento bebe 1
    day2=randi(7,N,1);  % Dia nacimiento bebe 2
    oneTboy= sex1==1 & day1==2 | sex2==1 & day2==2;
    Tboys= sex1==1 & sex2==1;
    oneTboyAnd2Boys= oneTboy & Tboys;
    P=sum(oneTboyAnd2Boys) / sum(oneTboy);
    if P>=0
        AP(i)=P;
    else
        AP(i)=0;
    end
    
end
figure(1)
    plot(AP,'sb','linewidth',1,'markersize',1);
