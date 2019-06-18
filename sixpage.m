prompt = 'What is the value of rNL? ';
rnl = input(prompt);
z=0:0.01:2;
fNL=((1-10^(rnl/10))/(2*10^(rnl/10)))*(((1+10^(rnl/10))/(1-10^(rnl/10)))-cos(pi*z-pi));
plot(z,fNL);
hold on;