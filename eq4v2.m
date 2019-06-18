x_upperlimit=12;   %value of x upperlimit
M=2;           %standard degrees of freedom for noncentral chi-square distribtuion
rsig=4;    %rNL value of signal
Pav_in=0.5;   %average power
sigma=0.09; 
P0=((4)/(rsig+3))*Pav_in;             %calculating P0
P1=((4*rsig)/(rsig+3))*Pav_in;    %calculating P1
d=0.01;  % step size
x=0:d:x_upperlimit;   %normalized input power
Xder=tanhderfunc(x);
G=2;
Y=x.*G;

[pdf1,pd2]=eq7call(x,sigma);
pdf3=(1/G).*pdf1;
pdf4=(1/G).*pdf2;

m1=mean(pdf3);
m2=mean(pdf4);
disp(m1);
disp(m2);
plot(Y,pdf4);
grid on;
hold on;
%temp2=1./tanhderfunc(inv(x));
plot(Y,pdf3);
grid on;
hold on;