
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
Y=tanhfunc(x);

pdf1=(1/(2.*sigma^2)).*((x/P0).^0.5).*exp(-((x+P0)/(2.*sigma^2))).*besseli(1,sqrt(x.*P0)/sigma^2);
pdf2=(1/(2.*sigma^2)).*((x/P1).^0.5).*exp(-((x+P1)/(2*sigma^2))).*besseli(1,sqrt(x.*P1)/sigma^2);

pdf3=abs(1./(Xder)).*pdf1;
pdf4=abs(1./(Xder)).*pdf2;

plot(Y,pdf4);
grid on;
hold on;
%temp2=1./tanhderfunc(inv(x));
plot(Y,pdf3);

grid on;
hold on;
%legend({'P0','P1'},...
%    'Location','NorthEast','FontSize',10);

q1=trapz(Y,pdf3,2);
disp(q1);
q2=trapz(Y,pdf4,2);
disp(q2);
grid on;
hold on;

diff=abs(pdf3-pdf4) < 0.01;
mindiff=min(diff);
int=find(diff==mindiff);
sub1=int(10);
xint=x(sub1);
yint=pdf3(sub1);
%disp(mindiff);
plot(xint,yint,'ko','MarkerSize',7);