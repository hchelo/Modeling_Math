clc; clear all; close all
T = open('Test 2_Multiple Reg.xlsx');
%load('valModel.mat');
y=T.data(:,1);
x1=T.data(:,2);
x2=T.data(:,3);
n=size(x1);
sumx1=sum(x1);
sumx2=sum(x2);
sumy=sum(y);
ym=mean(y);

x1y=x1.*y
sumx1y=sum(x1y)
Sx1y=sumx1y-sumx1*sumy/n(1)

x2y=x2.*y
sumx2y=sum(x2y)
Sx2y=sumx2y-sumx2*sumy/n(1)

x1x2=x1.*x2
sumx1x2=sum(x1x2)
Sx1x2=sumx1x2-sumx1*sumx2/n(1)

x122=x1.^2
sumx122=sum(x122)
Sx1_2=sumx122-sumx1^2/n(1)


x222=x2.^2
sumx222=sum(x222)
Sx2_2=sumx222-sumx2^2/n(1)

b1=(Sx1y*Sx2_2-Sx2y*Sx1x2)/(Sx1_2*Sx2_2-Sx1x2^2)
b2=(Sx2y*Sx1_2-Sx1y*Sx1x2)/(Sx1_2*Sx2_2-Sx1x2^2)
a=(sumy-b1*sumx1-b2*sumx2)/(n(1))

yp=a+b1.*x1+b2.*x2;

[a b1 b2]

scatter3(x1,x2,y,'filled')
hold on
x1fit = min(x1):0.1:max(x1);
x2fit = min(x2):10:max(x2);
[size(x1fit) size(x2fit)]
[X1FIT,X2FIT] = meshgrid(x1fit,x2fit);
YFIT = a + b1*X1FIT + b2*X2FIT ;
mesh(X1FIT,X2FIT,YFIT)
xlabel('logR')
ylabel('R')
zlabel('PGA(g)')
view(50,10)
hold off
