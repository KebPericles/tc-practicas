close all; 
clear all; 
clc;

%% PRACTICA 5: Filtros
% Filtro de Butterworth

wc = 2*pi*100;
fs = 1;
w = (-200:fs:200).*2.*pi;
N = 10;

hw = 1./(1 + (w./wc).^(2*N));

plot(w, hw)
grid on

xticks([-628 0 628])

%% Filtro digital pasabajas
% El filtro está contenido desde -pi a pi

wc2 = 0.2*pi;
nl = 3;
n = -nl:nl;
Nfft = 1000;
w2 = (-Nfft/2:(Nfft/2-1)).*2*pi/Nfft;

hn = wc2/pi.*(sin(wc2.*n)./(wc2.*n));
hn(isnan(hn)) = wc2/pi;



figure(2)
stem(n, hn)

Hw = fftshift(abs(fft(hn, Nfft)));

figure(3)
plot(w2, Hw)