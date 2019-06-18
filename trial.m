
rNL=20;
c=(((10.^(-rNL/10))+1))/2;             %define c
gamma=0.5;
fun=@(b) (tanh(b*0.5)/(b*gamma))+c-1;
b=fzero(fun,[1,5*10^20]);              %define b
a=1/(b*gamma);  
k=0.1;
d_RG=0.5;
y_BLOCK1=0:0.1:10;
D=ones(size(y_BLOCK1));
fNL_BLOCK1=ones(size(y_BLOCK1));
f1=(y_BLOCK1<=(1+k));
f2=(y_BLOCK1>(1+k));
D(f1)=a.*b.*((sech((y_BLOCK1(f1)-d_RG).*b)).^2);% derivate of tansfer function
fNL_BLOCK1(f1)=(a.*tanh((y_BLOCK1(f1)-d_RG).*b)+ c);%tanh transfer function
%D(f2)=a*b*((sech(((1+k)-d_RG)*b))^2);
fNL_BLOCK1(f2)=(D(f2).*(y_BLOCK1(f2)-(1+k)))+(a*tanh(b*((1+k)-d_RG)))+ c;
D1=1./D;
%PDF_fNL1_BLOCK1=(abs(D1)).*PDF_gain1_BLOCK1;
figure (3);
plot(y_BLOCK1, D1);
% plot(y_BLOCK1, fNL_BLOCK1);
hold on;
