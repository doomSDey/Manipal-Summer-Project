function Fi= tanhderfunc(z)
    close all;
   % z=0:0.001:5;
    rNL=20;
    gamma=.5;
       % rNL=input('enter rNL value:');
        c=(((10.^(-rNL/10))+1))/2; %define c
        l=0:1;
        %    gamma=input('enter gamma value:');
            fun=@(b) (tanh(b*0.5)/(b*gamma))+c-1;
            b=fzero(fun,[1,2*10^20]);              %define b
            a=1/(b*gamma);                         %define a
            Fi=(a*b)*(1-tanh(b*(z-.5)).^2);
            %disp(Fi);
            %Fder=diff(Fi);                           %function
           % plot(z,Fi)
            grid on
            hold on
         
end

