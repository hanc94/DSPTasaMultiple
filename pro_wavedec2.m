clc;
clear;
close all;

%Lee imagen
I=imread('1.png');

%Muestra imagen original
figure;
imshow(I);

%Wavelete Daubechies 1 (Haar)
wavelet='db1';

%Umbral de 10
threshold=10;

%Tres niveles de descomposición
L = 3;

%Realiza descomposición
[C, S]=wavedec2(double(I),L,wavelet);

%Obtiene coeficientes de aproximaciones
app=appcoef2(C,S,wavelet);
app=reshape(app,1,prod(S(1,:)));

%Obtiene coeficientes de detalles
det=C((prod(S(1,:))+1):end);

%Umbraliza los detalles
det_thresh=wthresh(det,'h',threshold);

%Invoca el método que codifica
det_cmp=compress(det_thresh);

%Invoca el método que decodifica
det_dcmp=decompress(det_cmp);

%Coeficientes para reconstrucción
C_dcmp=[app det_dcmp];

%Calcula la tasa de compresión
c_ratio=length(C)/(length(app)+length(det_cmp))

%Muestra imagen reconstruida
figure
C_rec=waverec2(C_dcmp,S,wavelet);
imshow(uint8(C_rec));
