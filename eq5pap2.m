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
G=2;
Y=G.*x;
x3=0:0.001:12;
[pdf1,pdf2]=eq4call(x,sigma);

for i=1:12001
        temp1=(1./(2*sigma^2)).*((x3(i)./x).^0.5).*exp(-((x3(i)+x)./(2*(sigma^2)))).*besseli(1,sqrt(x.*x3(i))./(sigma^2)).*pdf1;
        temp1(isinf(temp1)|isnan(temp1)) = 0;
        eq(i)=trapint(Y,temp1,0,6);
end
M=tanhfunc(x);
plot(M,eq);
hold on;
for i=1:12001
        temp1=(1./(2*sigma^2)).*((x3(i)./x).^0.5).*exp(-((x3(i)+x)./(2*(sigma^2)))).*besseli(1,sqrt(x.*x3(i))./(sigma^2)).*pdf2;
        temp1(isinf(temp1)|isnan(temp1)) = 0;
        eq2(i)=trapint(Y,temp1,0,6);
end
plot(M,eq2);
