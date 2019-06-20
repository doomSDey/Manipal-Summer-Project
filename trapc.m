function res=trapc(a,b,x,n)
    h=(b-a)/n;
    sum=0;
    for i=1:n
        sum=double(sum+x(i));
        if isnan(x(i))
            x(i)=0;
        end
    end
    res=(h/2).*(x(a+1)+x(b)+(2*sum));
end