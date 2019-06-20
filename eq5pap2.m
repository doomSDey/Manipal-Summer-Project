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

[pdf1,pdf2]=eq4call(x,sigma);

m1=mean(pdf1);
m2=mean(pdf2);

temp1=(1./(2*sigma^2)).*((m1./x).^0.5).*exp(-(m1+x)./(2*(sigma^2))).*besseli(1,sqrt(x.*m1)./(sigma^2)).*pdf1;
temp1(isnan(temp1))=0;
plot(x,temp1);
hold on;
q=trapint(x,temp1,0,5);
disp(q)

temp2=(1./(2*sigma^2)).*((m2./x).^0.5).*exp(-(m2+x)./(2*(sigma^2))).*besseli(1,sqrt(x.*m2)./(sigma^2)).*pdf2;
temp2(isnan(temp2))=0;
plot(x,temp2);
hold on;
q=trapint(x,temp2,0,5);
disp(q)