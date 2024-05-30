close all; 
clear all; 
clc; 


%% ====PRACTICA 3 MODULACION EN AMPLITUD ======
% Parte 1
% OBJETIVO: Analizar en el dominio del tiempo y de la frecuencia, señales
% de AM-DSB-LC

% Considere la señal modulante m(t) = cos(2pi t) y la portadora Xc(t) =
% Acos(20pi t)

fc = 10; % Frecuencia de portadora = 10[Hz] = 20pi[rad/s]
ts = 1/100;
Fs = 1/ts;

t = -0: ts :3;  

m_t = cos(2*pi.*t);
maxmsg = max(abs(m_t));

%% Fourier
N = 10000; 
w = 2.*pi.*((-N/2) : ((N/2) -1)).*(Fs/N);

% Mensaje 
M_wsn = fftshift(abs(fft(m_t,N)));
M_w = (M_wsn)/Fs;

%% a) Graficar t vs m(t)
figure(1)
plot(t,m_t)
xlabel("t [s]")
ylabel("m(t)")

saveas(gcf, "P3-imgs/1-inciso-a.png")
%% b) Graficar w vs |M(w)|
figure(2)
plot(w,M_w)
xlabel("w [rad]")
ylabel("|M(w)|")
xticks([-2*pi 2*pi])
xticklabels(["-2\pi" "2\pi"])
xlim([-10*2*pi 10*2*pi])
ylim([0 pi/2])
yticks([0 pi/2])
yticklabels(["0" "\pi/2"])

saveas(gcf, "P3-imgs/1-inciso-b.png")
%% c) Graficar phi(t) = (A + m(t))cos(20pi t), para A = 1, 2, 4
%    c1) Insertar las señales (A + m(t)) y -(A + m(t))
figure(3)
tile1 = tiledlayout(3,1);
tile2 = tiledlayout(tile1,'flow','TileSpacing','Compact');
tile3 = tiledlayout(tile1,'flow','TileSpacing','Compact');
tile4 = tiledlayout(tile1,'flow','TileSpacing','Compact');
tile3.Layout.Tile = 2;
tile4.Layout.Tile = 3;

% A = 1
nexttile(tile2)
A = 1;
phi_t = (A + m_t) .* cos(20*pi.*t);
m = maxmsg/A;

plot(t,phi_t)
title("(a)")

% c1)
nexttile(tile2)
plot(t,phi_t)
hold on
plot(t,m_t + A,Color="red")
plot(t,-m_t - A,Color="red")
title("(b)")

title(tile2, "Índice de modulación = "+string(m))

% A = 2
nexttile(tile3)
A = 2;
phi_t = (A + m_t) .* cos(20*pi.*t);
m = maxmsg/A;

plot(t,phi_t)
title("(c)")

%c1)
nexttile(tile3)
plot(t,phi_t)
hold on
plot(t,m_t + A,Color="red")
plot(t,-m_t - A,Color="red")
title("(d)")

title(tile3, "Índice de modulación = "+string(m))

% A = 4
nexttile(tile4)
A = 4;
phi_t = (A + m_t) .* cos(20*pi.*t);
m = maxmsg/A;

plot(t,phi_t)
title("(e)")

% c1)
nexttile(tile4)
plot(t,phi_t)
hold on
plot(t,m_t + A,Color="red")
plot(t,-m_t - A,Color="red")
title("(f)")

title(tile4, "Índice de modulación = "+string(m))

saveas(gcf, "P3-imgs/1-inciso-c.png")
%% d) Graficar la magnitud de los espectros en c)
figure(4)
tiledlayout(3,1)
% A = 1
nexttile
A = 1;
phi_t = (A + m_t) .* cos(20*pi.*t);
phi_w = fftshift(abs(fft(phi_t, N)))/Fs;

plot(w,phi_w)
title("(a) A=1")
xlabel("w [rad]")
ylabel("|M(w)|")
xticks([-20*pi 0 20*pi])
xticklabels(["-20\pi" "0" "20\pi"])
xlim([-15*2*pi 15*2*pi])
ylim([0 pi/2])
yticks([0 pi/4 pi/2])
yticklabels(["0" "\pi/4" "\pi/2"])

% A = 2
nexttile
A = 2;
phi_t = (A + m_t) .* cos(20*pi.*t);
phi_w = fftshift(abs(fft(phi_t, N)))/Fs;

plot(w,phi_w)
title("(b) A=2")
xlabel("w [rad]")
ylabel("|M(w)|")
xticks([-20*pi 0 20*pi])
xticklabels(["-20\pi" "0" "20\pi"])
xlim([-15*2*pi 15*2*pi])
ylim([0 pi])
yticks([0 pi/4 pi])
yticklabels(["0" "\pi/4" "\pi"])

% A = 4
nexttile
A = 4;
phi_t = (A + m_t) .* cos(20*pi.*t);
phi_w = (fftshift(abs(fft(phi_t, N))))/Fs;

plot(w,phi_w)
title("(c) A=4")
xlabel("w [rad]")
ylabel("|M(w)|")
xticks([-20*pi 0 20*pi])
xticklabels(["-20\pi" "0" "20\pi"])
xlim([-15*2*pi 15*2*pi])
ylim([0 2*pi])
yticks([0 pi/4 2*pi])
yticklabels(["0" "\pi/4" "2\pi"])

saveas(gcf, "P3-imgs/1-inciso-d.png")