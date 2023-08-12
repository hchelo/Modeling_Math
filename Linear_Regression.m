clc; clear all; close all
T = open('Test 1 SLR_GOR1 AND GOR2.xlsx');
%load('valModel.mat');
x=T.data(:,1);
y=T.data(:,2);
n=size(x);
x2=x.^2;
xy=x.*y;

SSxy= sum(xy)-(sum(x)*sum(y))/n(1) ; 
SSxx= sum(x2)-(sum(x)^2)/n(1) ; 

b1=SSxy/SSxx;
b0=mean(y)-b1*mean(x);

Yp=b0+b1*x; 

plot(x,y,'*')
hold on
plot(x,Yp)

title('SIMPLE LINEAL REGRESSION')
xlabel('X-Data')
ylabel('Y-Data')

