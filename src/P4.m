close all; 
clear all; 
clc;

%% PRACTICA 4: Señales de AM-SSB-SC
% Objetivo: analizar en el dominio del tiempo y frecuencia las
% características de las señales de AM-SSB-SC

% ------------
% Parte 1

% Considere la señal modulante
% f(t) = cos(2pi t) + 4cos(4pi t)
% y la portadora
% xc(t) = cos(20pi t)

ts = 1/1000;
Fs = 1/ts;

t = 0:ts:2;
N = 100000;
w = 2.*pi.*((-N/2) : ((N/2) -1)).*(Fs/N);

f_t = cos(2*pi.*t) + 4.*cos(4*pi.*t);
fh_t = sin(2*pi.*t) + 4.*sin(4*pi.*t);

fc = 10;
xc_t = cos(2*pi*fc.*t);
xch_t = sin(2*pi*fc.*t);

%% a) t vs phi(t) ---- AM-DSB-SC
figure(1)

phi_dsb_t = f_t .* xc_t;

plot(t,phi_dsb_t)
xlabel("t [s]")
ylabel("$\varphi(t)$","Interpreter","latex")

saveas(gcf, "P4-imgs/1-inciso-a.png")

%% b) w vs |F{phi(t)}|
figure(2)
tile_2 = tiledlayout(2,1);

phi_dsb_w = 2*pi.*fftshift(abs(fft(phi_dsb_t,N)))./length(t);

nexttile
plot(w,phi_dsb_w);

xlim([-30*pi 30*pi])
xticks([-2*pi*fc-4*pi -2*pi*fc+4*pi 0 2*pi*fc-4*pi 2*pi*fc+4*pi])
xticklabels(["-24\pi" "-16\pi" "0" "16\pi" "24\pi"])

yticks([0 pi/2 2*pi])
yticklabels(["0" "\pi/2" "2\pi"])

title("(a)")
grid on

% ACERCAMIENTO
nexttile
plot(w,phi_dsb_w);

xlim([10*pi 30*pi])
xticks([10*pi 2*pi*fc-4*pi 2*pi*fc-2*pi 2*pi*fc 2*pi*fc+2*pi 2*pi*fc+4*pi 30*pi])
xticklabels(["10\pi" "16\pi" "18\pi" "20\pi" "22\pi" "24\pi" "30\pi"])

yticks([0 pi/2 2*pi])
yticklabels(["0" "\pi/2" "2\pi"])

title("(b)")
grid on

xlabel(tile_2, "$\omega \left[\frac{rad}{s} \right]$", "Interpreter","latex")
ylabel(tile_2, "$|\varphi(\omega)| [W]$","Interpreter","latex")

saveas(gcf, "P4-imgs/1-inciso-b.png")
%% c) t vs phi(t) = f(t)xc(t) + fh(t)xch(t) ---- AM-SSB-SC

figure(3)

phi_ssb_t = f_t .* xc_t + fh_t .* xch_t;

plot(t,phi_ssb_t)
xlabel("t [s]")
ylabel("$\varphi(t)$","Interpreter","latex")

saveas(gcf, "P4-imgs/1-inciso-c.png")

%% d) w vs |F{phi(t)}|

figure(4)
tile_4 = tiledlayout(2,1);

phi_ssb_w = 2*pi.*fftshift(abs(fft(phi_ssb_t,N)))./length(t);

nexttile
plot(w,phi_ssb_w);

xlim([-30*pi 30*pi])
xticks([-2*pi*fc-4*pi -2*pi*fc+4*pi 0 2*pi*fc-4*pi 2*pi*fc+4*pi])
xticklabels(["-24\pi" "-16\pi" "0" "16\pi" "24\pi"])

yticks([0 pi 4*pi])
yticklabels(["0" "\pi" "4\pi"])

title("(a)")
grid on

% ACERCAMIENTO
nexttile
plot(w,phi_ssb_w);

xlim([10*pi 30*pi])
xticks([10*pi 2*pi*fc-4*pi 2*pi*fc-2*pi 2*pi*fc 2*pi*fc+2*pi 2*pi*fc+4*pi 30*pi])
xticklabels(["10\pi" "16\pi" "18\pi" "20\pi" "22\pi" "24\pi" "30\pi"])

yticks([0 pi 4*pi])
yticklabels(["0" "\pi" "4\pi"])

title("(b)")
grid on

xlabel(tile_4, "$\omega \left[\frac{rad}{s} \right]$", "Interpreter","latex")
ylabel(tile_4, "$|\varphi(\omega)| [W]$","Interpreter","latex")

saveas(gcf, "P4-imgs/1-inciso-d.png")
%% e) comparar en una misma gráfica b) y d)
figure(5)
plot(w, phi_dsb_w)
hold on
plot(w,phi_ssb_w)

xlim([-30*pi 30*pi])
xticks([-2*pi*fc-4*pi -2*pi*fc-2*pi -2*pi*fc+2*pi -2*pi*fc+4*pi 0 2*pi*fc-4*pi 2*pi*fc-2*pi 2*pi*fc+2*pi 2*pi*fc+4*pi])
xticklabels(["-24\pi" "" "" "-16\pi" "0" "16\pi" "" "" "24\pi"])

yticks([0 pi/2 pi 2*pi 4*pi])
yticklabels(["0" "\pi/2" "\pi" "2\pi" "4\pi"])

xlabel("$\omega \left[\frac{rad}{s} \right]$", "Interpreter","latex")
ylabel("$|\varphi(\omega)| [W]$","Interpreter","latex")
grid on

saveas(gcf, "P4-imgs/1-inciso-e.png")

%% f) Repetir e) con phi(t) = f(t)xc(t) - fh(t)xch(t) 
figure(6)

phi_ssb_t = f_t .* xc_t - fh_t .* xch_t;
phi_ssb_w = 2*pi.*fftshift(abs(fft(phi_ssb_t,N)))./length(t);

plot(w, phi_dsb_w)
hold on
plot(w,phi_ssb_w)

xlim([-30*pi 30*pi])
xticks([-2*pi*fc-4*pi -2*pi*fc-2*pi -2*pi*fc+2*pi -2*pi*fc+4*pi 0 2*pi*fc-4*pi 2*pi*fc-2*pi 2*pi*fc+2*pi 2*pi*fc+4*pi])
xticklabels(["-24\pi" "" "" "-16\pi" "0" "16\pi" "" "" "24\pi"])

yticks([0 pi/2 pi 2*pi 4*pi])
yticklabels(["0" "\pi/2" "\pi" "2\pi" "4\pi"])

xlabel("$\omega \left[\frac{rad}{s} \right]$", "Interpreter","latex")
ylabel("$|\varphi(\omega)| [W]$","Interpreter","latex")
grid on

saveas(gcf, "P4-imgs/1-inciso-f.png")