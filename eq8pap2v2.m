
x_upperlimit=12;   %value of x upperlimit
M=2;           %standard degrees of freedom for noncentral chi-square distribtuion
rsig=10;    %rNL value of signal
Pav_in=0.5;   %average power
sigma=0.09;
P0=((4)/(rsig+3))*Pav_in;   %calculating P0
P1=((4*rsig)/(rsig+3))*Pav_in;    %calculating P1
d=0.01;  % step size
x=0:d:x_upperlimit;   %normalized input power

%a=1./(2.*(sigma.^2));

c101=(x<((700*2*(sigma^2))-P0));
a1(c101)=1./(2.*(sigma.^2));
b1(c101)=((x(c101)./P0).^((M-1)./2));
c1(c101)=(-(x(c101)+P0))./(2.*(sigma.^2));
d1(c101)=(sqrt(x(c101).*P0))./(sigma.^2);
pdf1(c101)=a1(c101).*b1(c101).*exp(c1(c101)).*besseli(1,d1(c101));

c102=(x>=((700*2*(sigma^2))-P0) & x<((700^2*sigma^4)/P0));
a1(c102)=1./(2.*(sigma.^2));
b1(c102)=((x(c102)./P0).^((M-1)./2));
c1(c102)=(-(x(c102)+P0))./(2.*(sigma.^2));
d1(c102)=(sqrt(x(c102).*P0))./(sigma.^2);
pdf1(c102)=a1(c102).*b1(c102).*exp(c1(c102)+d1(c102)).*besseli(1,d1(c102)).*exp(-d1(c102));

c103=(x>((700^2*sigma^4)/P0));
a1(c103)=1./(2.*(sigma.^2));
b1(c103)=((x(c103)./P0).^((M-1)./2));
c1(c103)=(-(x(c103)+P0))./(2.*(sigma.^2));
d1(c103)=(sqrt(x(c103).*P0))./(sigma.^2);
pdf1(c103)=(a1(c103).*b1(c103).*exp(c1(c103)+d1(c103)))./(sqrt(2.*pi.*d1(c103)));


c111=(x<((700*2*(sigma^2))-P1));
a2(c111)=1./(2.*(sigma.^2));
b2(c111)=((x(c111)./P1).^((M-1)./2));
c2(c111)=(-(x(c111)+P1))./(2.*(sigma.^2));
d2(c111)=(sqrt(x(c111).*P1))./(sigma^2);
pdf2(c111)=a2(c111).*b2(c111).*exp(c2(c111)).*besseli(1,d2(c111));

c112=(x>=((700*2*(sigma^2))-P1) & x<((700^2*sigma^4)/P1));
a2(c112)=1./(2.*(sigma.^2));
b2(c112)=((x(c112)./P1).^((M-1)./2));
c2(c112)=(-(x(c112)+P1))./(2.*(sigma.^2));
d2(c112)=(sqrt(x(c112).*P1))./(sigma.^2);
pdf2(c112)=a2(c112).*b2(c112).*exp(c2(c112)+d2(c112)).*besseli(1,d2(c112)).*exp(-d2(c112));

c113=(x>((700^2*sigma^4)/P1));
a2(c113)=1./(2.*(sigma.^2));
b2(c113)=((x(c113)./P1).^((M-1)./2));
c2(c113)=(-(x(c113)+P1))./(2.*(sigma.^2));
d2(c113)=(sqrt(x(c113).*P1))./(sigma.^2);
pdf2(c113)=(a2(c113).*b2(c113).*exp(c2(c113)+d2(c113)))./(sqrt(2.*pi.*d2(c113)));

plot(x,pdf1);
q1=trapz(x,pdf1,2);
disp(q1);
hold on;
plot(x,pdf2);
q1=trapz(x,pdf2,2);
disp(q1);


diff=abs(pdf1-pdf2) < 0.0001;
mindiff=max(diff);
int=find(diff==mindiff);
sub1=int(2);
xint=x(sub1);
yint=pdf1(sub1);
%disp(mindiff);
plot(xint,yint,'ko','MarkerSize',7);
grid on;
hold on;
ber1=trapint(x,pdf1,xint,0);
ber2=trapint(x,pdf2,11,xint);
ber=0.5*(ber1+ber2);
disp(ber);