close all; 
clear all; 
clc;

%% PRACTICA 4: Señales de AM-SSB-SC
% Objetivo: analizar en el dominio del tiempo y frecuencia las
% características de las señales de AM-SSB-SC

% ------------
% Parte 2

% Considere la señal modulante
% f(t) = sen(t)/t
% fh(t) = (1-cos(t))/t
% y la portadora
% xc(t) = cos(4pi t)

ts = 1/1000;
Fs = 1/ts;

t = [(-15:ts:0-ts), (0+ts:ts:15)];

N = 8*length(t);
w = 2.*pi.*((-N/2) : ((N/2) -1)).*(Fs/N);

f_t = sin(t)./t;
fh_t = (1-cos(t))./t;

fc = 2;
xc_t = cos(2*pi*fc.*t);
xch_t = sin(2*pi*fc.*t);

%% a) t vs phi(t) ---- AM-DSB-SC
figure(1)

phi_dsb_t = f_t .* xc_t;

plot(t,phi_dsb_t)
xlabel("t [s]")
ylabel("$\varphi(t)$","Interpreter","latex")

saveas(gcf, "P4-imgs/2-inciso-a.png")

%% b) w vs |F{phi(t)}|
figure(2)
tile_2 = tiledlayout(2,1);

phi_dsb_w = 2*pi.*fftshift(abs(fft(phi_dsb_t,N)))./length(t);

nexttile
plot(w,phi_dsb_w);

xlim([-6*pi 6*pi])

title("(a)")
grid on

% ACERCAMIENTO
nexttile
plot(w,phi_dsb_w);

xlim([3*pi 5*pi])

title("(b)")
grid on

xlabel(tile_2, "$\omega \left[\frac{rad}{s} \right]$", "Interpreter","latex")
ylabel(tile_2, "$|\varphi(\omega)| [W]$","Interpreter","latex")

saveas(gcf, "P4-imgs/2-inciso-b.png")

%% c) t vs phi(t) = f(t)xc(t) + fh(t)xch(t) ---- AM-SSB-SC

figure(3)

phi_ssb_t = f_t .* xc_t + fh_t .* xch_t;

plot(t,phi_ssb_t)
xlabel("t [s]")
ylabel("$\varphi(t)$","Interpreter","latex")

saveas(gcf, "P4-imgs/2-inciso-c.png")

%% d) w vs |F{phi(t)}|

figure(4)
tile_4 = tiledlayout(2,1);

phi_ssb_w = 2*pi.*fftshift(abs(fft(phi_ssb_t,N)))./length(t);

nexttile
plot(w,phi_ssb_w);

xlim([-6*pi 6*pi])

title("(a)")
grid on

% ACERCAMIENTO
nexttile
plot(w,phi_ssb_w);

xlim([3*pi 5*pi])

title("(b)")
grid on

xlabel(tile_4, "$\omega \left[\frac{rad}{s} \right]$", "Interpreter","latex")
ylabel(tile_4, "$|\varphi(\omega)| [W]$","Interpreter","latex")

saveas(gcf, "P4-imgs/2-inciso-d.png")

%% e) comparar en una misma gráfica b) y d)
figure(5)
plot(w, phi_dsb_w)
hold on
plot(w,phi_ssb_w)

xlim([-6*pi 6*pi])

xlabel("$\omega \left[\frac{rad}{s} \right]$", "Interpreter","latex")
ylabel("$|\varphi(\omega)| [W]$","Interpreter","latex")
grid on

saveas(gcf, "P4-imgs/2-inciso-e.png")

%% f) Repetir e) con phi(t) = f(t)xc(t) - fh(t)xch(t) 
figure(6)

phi_ssb_t = f_t .* xc_t - fh_t .* xch_t;
phi_ssb_w = 2*pi.*fftshift(abs(fft(phi_ssb_t,N)))./length(t);

plot(w, phi_dsb_w)
hold on
plot(w,phi_ssb_w)

xlim([-6*pi 6*pi])

xlabel("$\omega \left[\frac{rad}{s} \right]$", "Interpreter","latex")
ylabel("$|\varphi(\omega)| [W]$","Interpreter","latex")
grid on

saveas(gcf, "P4-imgs/2-inciso-f.png")
