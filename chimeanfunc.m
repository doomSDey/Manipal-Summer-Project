function chimeanfunc(zsin,sigma)
    u=0:0.01:10;
    fprintf("U\n");
    disp(u);
    fzf=(1/(2*sigma)).*exp(-(u+zsin)/(2*sigma)).*(u/zsin).^0.5.*besseli(1,((u*zsin).^0.5)/sigma);
    disp fzf;
    disp(fzf);
    plot(u,fzf);

    grid on;
    hold on;
end

