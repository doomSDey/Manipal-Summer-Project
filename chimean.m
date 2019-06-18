prompt = 'What is the value of zsin? ';
zsin = input(prompt);
prompt = 'What is the value of sigma^2? ';
sigma=input(prompt);
u=0:0.01:10;
fzf=(1/(2*sigma)).*exp(-(u+zsin)/(2*sigma)).*(u/zsin).^0.5.*besseli(1,((u*zsin).^0.5)/sigma);
plot(u,fzf);
q1=trapz(u,fzf,2);
disp(q1);
grid on;
hold on;

