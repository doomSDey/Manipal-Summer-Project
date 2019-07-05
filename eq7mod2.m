
x_upperlimit=12;   %value of x upperlimit
M=2;           %standard degrees of freedom for noncentral chi-square distribtuion
rsig=4;    %rNL value of signal
Pav_in=0.5;   %average power
sigma=0.09; 
P0=((4)/(rsig+3))*Pav_in;             %calculating P0
P1=((4*rsig)/(rsig+3))*Pav_in;    %calculating P1
d=0.001;  % step size
x=0:d:x_upperlimit;   %normalized input power
Xder=tanhderfunc(x);
Y=tanhfunc(x);


[pdf1,pdf2]=eq5call(x,sigma);

pdf3=abs(1./(tanhderfunc(x))).*pdf1;
pdf4=abs(1./(tanhderfunc(x))).*pdf2;

%plot(Y,pdf4);
grid on;
hold on;
%temp2=1./tanhderfunc(inv(x));
plot(Y,pdf3);

grid on;
hold on;
%legend({'P0','P1'},...
%    'Location','NorthEast','FontSize',10);
pdf3(isinf(pdf3)|isnan(pdf3)) = 0;
q2=trapz(Y,pdf3);
%disp(q2);
pdf4(isinf(pdf4)|isnan(pdf4)) = 0;
%q3=trapz(x,pdf3);
disp(q3);
grid on;
hold on;

diff=abs(pdf1-pdf2) < 0.1;
mindiff=max(diff);
int=find(diff==mindiff);
i=1;
if(sigma<0.09)
    m=0.3;
elseif(sigma<=0.09)
    m=0.2;
end
while(x(i)<m)
    i=i+1;
end
sub1=int(i);
xint=x(sub1);
yint=pdf1(sub1);
%disp(mindiff);
plot(xint,yint,'ko','MarkerSize',7);
grid on;
hold on;
hold on;