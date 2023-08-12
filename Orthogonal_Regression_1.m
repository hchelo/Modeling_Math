clc; clear all; close all
T = open('Test 1 SLR_GOR1 AND GOR2.xlsx');
%load('valModel.mat');
x=T.data(:,1);
y=T.data(:,2);;
n=size(x);
xm=mean(x);
ym=mean(y);

%(x-xm)^2
ecux=(x-xm).^2;

%(x-xm)(y-ym)
ecuxy=(x-xm).*(y-ym); 

%(y-ym)^2
ecuy=(y-ym).^2;

Sxx= 1/(n(1)-1) * sum(ecux) ;
Sxy= 1/(n(1)-1) * sum(ecuxy);
Syy= 1/(n(1)-1) * sum(ecuy) ;

ita=0.2;

B1= ( Syy - ita*Sxx + sqrt ((Syy-ita*Sxx)^2 + 4*ita*(Sxy^2)) )/ (2*Sxy) ;
B0= ym - B1* xm;

Yp=B0+B1*x; 

plot(x,y,'*')
hold on
plot(x,Yp)

title('ORTHOGONAL REGRESSION - GOR')
xlabel('X-Data')
ylabel('Y-Data')


