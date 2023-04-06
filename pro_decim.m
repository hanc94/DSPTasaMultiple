clc;
clear;
close all;

D=5;

t = 0:.0001:.0625;
y = square(2*pi*400*t);

figure;
plot(t,y);
grid on;


[H O]=freqz(y);
% H=fft(y);
figure;
 plot(O,abs(H/length(H)));
%  plot(2*pi*(0:(length(H)-1))/length(H),abs(H));
grid on;


y_d=downsample(y,D);

figure;
plot((0:(length(y_d)-1))/(length(y_d)-1)*t(end),y_d);
grid on;


[H_d O_d]=freqz(y_d);
figure;
plot(O_d,abs(D*H_d/length(H_d)));
grid on;

h=fir1(61,1/D);
[H_f O_f]=freqz(h);
figure;
plot(O_f,abs(H_f));
grid on;

% y_o=filter(h,1,y);
% y_d=downsample(y_o,D);

% y_d=resample(y,1,D);
y_d=decimate(y,D);

figure;
plot((0:(length(y_d)-1))/(length(y_d)-1)*t(end),y_d);
grid on;



[H_d O_d]=freqz(y_d);
figure;
plot(O_d,abs(D*H_d/length(H_d)));
grid on;


figure;
plot((0:(length(y_d)-1))/(length(y_d)-1)*t(end),decimate(y,D));
grid on;


