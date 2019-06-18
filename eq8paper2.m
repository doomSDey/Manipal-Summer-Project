
x_upperlimit=12;   %value of x upperlimit
M=2;           %standard degrees of freedom for noncentral chi-square distribtuion
rsig=10;    %rNL value of signal
Pav_in=0.5;   %average power
sigma=0.07;
P0=((4)/(rsig+3))*Pav_in;   %calculating P0
P1=((4*rsig)/(rsig+3))*Pav_in;    %calculating P1
d=0.001;  % step size
x=0:d:x_upperlimit;   %normalized input power

pdf0=(1/(2*(sigma^2))).*((x/P0).^0.5).*exp(-((x+P0)/(2.*(sigma^2)))).*besseli(1,sqrt(x.*P0)/(sigma^2));
plot(x,pdf0);
q1=trapz(x,pdf0,2);
disp(q1);
grid on;
hold on;

pdf1=(1/(2*sigma^2)).*((x/P1).^0.5).*exp(-((x+P1)/(2*sigma^2))).*besseli(1,sqrt(x*P1)/sigma^2);
plot(x,pdf1);
q1=trapz(x,pdf1,2);
disp(q1);
diff=abs(pdf1-pdf0) < 0.0001;
mindiff=max(diff);
int=find(diff==mindiff);
sub1=int(2);
xint=x(sub1);
yint=pdf1(sub1);
%disp(mindiff);
plot(xint,yint,'ko','MarkerSize',7);
grid on;
hold on;
ber1=trapint(x,pdf0,xint,0);
ber2=trapint(x,pdf1,10,xint);
ber=0.5*(ber1+ber2);
disp(ber);