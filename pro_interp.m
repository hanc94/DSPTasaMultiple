clc;
clear;
close all;

N=5;

fs=1e3;
t = 0:1/fs:.0625;
y = square(2*pi*30*t);

figure;
plot(t,y);
grid on;


[H O]=freqz(y);
figure;
plot(O,abs(H));
grid on;


y_u=upsample(y,N);

figure;
plot((0:(length(y_u)-1))/(length(y_u)-1)*t(end),y_u);
grid on;


[H_u O_u]=freqz(y_u);
figure;
plot(O_u,abs(H_u));
grid on;

h=N*fir1(61,1/N);
[H_f O_f]=freqz(h);
figure;
plot(O_f,abs(H_f));
grid on;

% y_o=filter(h,1,y_u);
% y_o=resample(y,N,1);
y_o=interp(y,N);

figure;
plot((0:(length(y_u)-1))/(length(y_u)-1)*t(end),y_o);
grid on;



[H_o O_o]=freqz(y_o);
figure;
plot(O_o,abs(H_o));
grid on;


figure;
plot((0:(length(y_u)-1))/(length(y_u)-1)*t(end),interp(y,N));
grid on;


