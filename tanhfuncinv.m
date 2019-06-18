function F= tanhfuncinv(z)
    close all;
    %z=0:0.1:10;
    rNL=20;
    gamma=.5;
       % rNL=input('enter rNL value:');
        c=(((10.^(-rNL/10))+1))/2; %define c
        %    gamma=input('enter gamma value:');
            fun=@(b) (tanh(b*0.5)/(b*gamma))+c-1;
            b=fzero(fun,[1,2*10^20]);              %define b
            a=1/(b*gamma);                         %define a
            F1=(a*b)*(1-tanh((z-0.5)*b).^2);
            F=1./F1;
            %function
            %display(F) 
     %   plot(z,F)
            %grid on
           % hold on
end

