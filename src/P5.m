close all; 
clear all; 
clc;

%% PRACTICA 5 (2° parte del curso)
% Retardo de grupo y retardo de fase de una señal que pasa por un sistema
% de comunicación.

ts = 1/100;
Fs = 1/ts;

t = 0:ts:35;
N = 100000;
w = 2.*pi.*((-N/2) : ((N/2) -1)).*(Fs/N);

vi_t = sin(0.6 .* t);
vo_t = 1/34 .* (15.* cos(0.6.*t) + 9.*sin(0.6.*t) - 15.* exp(-t));

close 1
figure(1)
hold on
plot(t, vi_t)
plot(t, vo_t)