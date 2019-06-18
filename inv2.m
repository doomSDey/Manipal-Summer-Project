function F2= inv2(z)
    close all;
  %z=0:0.1:10;
    rNL=20;
    gamma=.5;
f1=(z<=(1.1));
f2=(z>(1.1));
       % rNL=input('enter rNL value:');
        c=(((10.^(-rNL/10))+1))/2; %define c
        %    gamma=input('enter gamma value:');
            fun=@(b) (tanh(b*0.5)/(b*gamma))+c-1;
            b=fzero(fun,[1,2*10^20]);              %define b
            a=1/(b*gamma);                         %define a
            F=ones(size(z));
            F(f1)=(a*b)*(1-tanh((z(f1)-0.5)*b).^2); %function
            F(f2)=(a*b)*(1-tanh(((1+0.1)-0.5)*b).^2);
            F2=1./F;
            %display(F) 
   %     plot(z,F2)
            %grid on
           % hold on
end

