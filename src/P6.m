
close all; 
clear all; 
clc; 

R = 330;        %VALORES A ESCOGER
C = 0.00001;    %VALORES A ESCOGER
f = 100;         %FRECUENCIA DE LA SEÑAL A ESCOGER

%===========II)==========
w = 0:1/100:2500;
f = w./(2.*pi);

magnitud = w./(sqrt((1/(R*C).^2) + w.^2)); 
qw = atan(1./(w.*R.*C)); 
%====MAGNITUD DE LA RESPUESTA EN FRECUENCIA=====
figure(1)
plot(f, magnitud, 'm', 'LineWidth', 1); 
title('|H(S)| MAGNITUD DE LA RESPUESTA EN FRECUENCIA'); 
xlabel('f_{ (HZ)}'); 
ylabel('|H(S)|_{ (Amplitud)}'); 
grid on; 
%======FASE DE LA RESPUESTA EN FRECUENCIA=======
figure(2)
plot(f, qw, 'r', 'LineWidth', 1); 
title('θ(w) FASE DE LA RESPUESTA EN FRECUENCIA'); 
grid on; 
xlabel('f_{ (Hz)}'); 
ylabel('θ(w)_{ (Amplitud)}');