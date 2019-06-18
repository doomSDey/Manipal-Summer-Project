function F= tanhfunc(z)
    close all;
    %z=0:0.0001:5;
    rNL=20;
    gamma=.5;
    v=0:1;
    for i=1:length(v)
       % rNL=input('enter rNL value:');
        c=(((10.^(-rNL/10))+1))/2; %define c
        l=0:1;
        for k=1:length(l)
        %    gamma=input('enter gamma value:');
            fun=@(b) (tanh(b*0.5)/(b*gamma))+c-1;
            b=fzero(fun,[1,2*10^20]);              %define b
            a=1/(b*gamma);                         %define a
            F=(a*(tanh(b*(z-0.5))))+c;             %function
            %display(F) 
            %plot(z,F)
            %grid on
           % hold on
        end 
    end
end

