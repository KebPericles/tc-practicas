clc;
clear all;
close all;

%% Constantes

ts = 1/1000;
fs = 1/ts;
N = 500;
ajuste_w = 10;

t = -0.07:ts:0.07;
f = (-N/2:(N/2) - 1) .* fs./N;
w_visual = 2 * pi .* f ./ ajuste_w;
w = 2 * pi .* f;

%% FUNCIONES

ft = triangulo(t);
Xct = cos(100 * pi .* t);

fmt = ft .* Xct;

%% FT teórica

Fw = 6.*((sin(w.*0.03)./(w.*0.03)).^2);

%% FFT Ft
fftw = fftshift(abs(fft(ft, N)));

Fwn = (fftw)./fs;

%% fft Xc
fftxcw = fftshift(abs(fft(Xct, N)));

Xcwn = 2*pi.*(fftxcw)./length(t);

%% GRÁFICAS
%% A) t vs f(t)
figure(1)
plot(t,ft)

%% b) w vs |F(w)|
figure(2)
subplot(1, 2, 1, "replace")
plot(w, Fw)
title("Transformada teórica")
configPlot(w_visual)


subplot(1, 2, 2, "replace")
plot(w, Fwn)
title("FFT Normalizada")
configPlot(w_visual)

figure(99)
plot(w,Fw, w,Fwn)
configPlot(w_visual)

%% c) t vs Xc(t)
figure(3)
plot(t,Xct)

%% d) w vs |Xc(w)|
figure(4)
plot(w, Xcwn)
configPlot(w_visual)
%% e) t vs f(t)Xc(t)
figure(5)
plot(t,fmt, t,ft, t,-ft)
%% f) w vs |fft(f(t)Xc(t))|

%% Funciones personales
function trianguloArr = triangulo(t)
    trianguloArr = zeros(1,length(t));
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    for ti = 1:length(t)
        if t(ti) <= -0.06 || t(ti) >= 0.06
            trianguloArr(ti) = 0;
        elseif t(ti) > -0.06 && t(ti) <= 0
            trianguloArr(ti) = (100/0.06 * t(ti) + 100);
        elseif t(ti) > 0
            trianguloArr(ti) = (-100/0.06 * t(ti) + 100);
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
end

function configPlot(w)
    xlim([min(w) (max(w)+pi)])
    wstep = (-min(w))/2;
    xticks(min(w):wstep:-min(w))
    xticklabels(string((min(w):wstep:-min(w))./pi) + "\pi")
end