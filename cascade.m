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
Y=tanhfunc(x);

[pdf1,pdf2]=eq4call(x,sigma);

m1=mean(pdf1);
m2=mean(pdf2);
%for i=1:5
    temp1=(1./(2*sigma^2)).*((m1./x).^0.5).*exp(-(m1+x)./(2*(sigma^2))).*besseli(1,sqrt(x.*m1)./(sigma^2)).*pdf1;
    temp1(isnan(temp1))=0;
    plot(x,temp1);
    hold on;
    q1=trapint(x,temp1,0,5);
    disp(q1)

    temp2=(1./(2*sigma^2)).*((m2./x).^0.5).*exp(-(m2+x)./(2*(sigma^2))).*besseli(1,sqrt(x.*m2)./(sigma^2)).*pdf2;
    temp2(isnan(temp2))=0;
    plot(x,temp2);
    hold on;
    q2=trapint(x,temp2,0,5);
    disp(q2)
    
    pdf3=(1./tanhderfunc(x)).*q1;
    
    pdf4=(1./tanhderfunc(x)).*q2;
    
    plot(Y,pdf3);
    hold on;
    plot(Y,pdf4);


    diff=abs(pdf1-pdf2) < 0.1;
    mindiff=max(diff);
    int=find(diff==mindiff);
    j=1;
    if(sigma<0.05)
        m=0.5;
    else
        m=0.1;
    end
    while(x(j)<m)
        j=j+1;
    end
    sub1=int(j);
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
    
    pdf1=(1/G).*pdf3;
    pdf2=(1/G).*pdf4;
