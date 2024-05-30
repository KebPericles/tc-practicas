close all; 
clear all; 
clc; 


%% ====PRACTICA 3 MODULACION EN AMPLITUD ======
% OBJETIVO: Analizar en el dominio del tiempo y de la frecuencia, señales
% de AM-DSB-LC

% Parte 2

% La señal modulante está dada por 
% m(t) = 4 cos(2pi t - pi/4) + 2 sen(4pi t)
% Xc(t) = Acos(20pi t)    (A=2)

fc = 10; % Frecuencia de portadora = 10[Hz] = 20pi[rad/s]
A = 2;
ts = 1/100;
Fs = 1/ts;

t = -0: ts :3;  

m_t = 4.*cos(2*pi.*t - pi/9) + 2.*sin(4*pi.*t);
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

saveas(gcf, "P3-imgs/2-inciso-a.png")
%% b) Graficar w vs |M(w)|
figure(2)
plot(w,M_w)
xlabel("w [rad]")
ylabel("|M(w)|")
xticks([-2*pi 2*pi])
xticklabels(["-2\pi" "2\pi"])
xlim([-10*2*pi 10*2*pi])
%ylim([0 pi/2])
yticks([0 pi 2*pi])
yticklabels(["0" "\pi" "2\pi"])

saveas(gcf, "P3-imgs/2-inciso-b.png")
%% c) t vs mn(t)
figure(3)
mn_t = m_t./abs(min(m_t));
plot(t, mn_t)

saveas(gcf, "P3-imgs/2-inciso-c.png")
%% d) Graficar phi(t) = 2*(1 + m*mn(t))cos(20pi t), para m = 1, 0.5, 0.25
%    c1) Insertar las señales 2*(1 + m*mn(t)) y -2*(1 + m*mn(t))
figure(4)
tile1 = tiledlayout(3,1);
tile2 = tiledlayout(tile1,'flow','TileSpacing','Compact');
tile3 = tiledlayout(tile1,'flow','TileSpacing','Compact');
tile4 = tiledlayout(tile1,'flow','TileSpacing','Compact');
tile3.Layout.Tile = 2;
tile4.Layout.Tile = 3;

% m = 1
nexttile(tile2)
m = 1;
phi_t = 2.*(1 + m.*mn_t) .* cos(20*pi.*t);

plot(t,phi_t)
title("(a)")

% c1)
nexttile(tile2)
plot(t,phi_t)
hold on
plot(t,2.*(1 + m.*mn_t),Color="red")
plot(t,-2.*(1 + m.*mn_t),Color="red")
title("(b)")

title(tile2, "Índice de modulación = "+string(m))

% m = 0.5
nexttile(tile3)
m = 0.5;
phi_t = 2.*(1 + m.*mn_t) .* cos(20*pi.*t);

plot(t,phi_t)
title("(c)")

%c1)
nexttile(tile3)
plot(t,phi_t)
hold on
plot(t,2.*(1 + m.*mn_t),Color="red")
plot(t,-2.*(1 + m.*mn_t),Color="red")
title("(d)")

title(tile3, "Índice de modulación = "+string(m))

% m = 0.25
nexttile(tile4)
m = 0.25;
phi_t = 2.*(1 + m.*mn_t) .* cos(20*pi.*t);

plot(t,phi_t)
title("(e)")

% c1)
nexttile(tile4)
plot(t,phi_t)
hold on
plot(t,2.*(1 + m.*mn_t),Color="red")
plot(t,-2.*(1 + m.*mn_t),Color="red")
title("(f)")

title(tile4, "Índice de modulación = "+string(m))

saveas(gcf, "P3-imgs/2-inciso-d.png")
%% e) Graficar la magnitud de los espectros en d)
figure(5)
tiledlayout(3,1)
% A = 1
nexttile
m = 1;
phi_t = 2.*(1 + m.*mn_t) .* cos(20*pi.*t);
phi_w = fftshift(abs(fft(phi_t, N)))/Fs;

plot(w,phi_w)
title("(a) A=1")
xlabel("w [rad]")
ylabel("|M(w)|")


% A = 2
nexttile
m = 0.5;
phi_t = 2.*(1 + m.*mn_t) .* cos(20*pi.*t);
phi_w = fftshift(abs(fft(phi_t, N)))/Fs;

plot(w,phi_w)
title("(b) A=2")
xlabel("w [rad]")
ylabel("|M(w)|")

% A = 4
nexttile
m = 0.25;
phi_t = 2.*(1 + m.*mn_t) .* cos(20*pi.*t);
phi_w = (fftshift(abs(fft(phi_t, N))))/Fs;

plot(w,phi_w)
title("(c) A=4")
xlabel("w [rad]")
ylabel("|M(w)|")

saveas(gcf, "P3-imgs/2-inciso-e.png")