close all; 
clear all; 
clc; 


%% ====PRACTICA 2 MODULACION EN AMPLITUD ======
% OBJETIVO: Analizar señales de AM-DSB-SC en el dominio del tiempo y
% frecuencia utilizando las funciones de matlab (ammod() y amdemod())

fc = 50;
ts = 1/1000;
Fs = 1/ts;

t = -0.07: ts :0.07;  

f1 = 0.*((-0.07 <= t)&(t <= -0.06)); 
f2 = ((100/0.06).*t + 100).*((-0.06 <= t)&(t <= 0)); 
f3 = (-(100/0.06).*t + 100).*((0 < t)&(t <= 0.06)); 
f4 = 0.*((0.06 <= t) & (t <= 0.07)); 

mt = f1 + f2 + f3 + f4; 

%% ========== MOD Y DEMOD ===========
fit = ammod(mt,fc,Fs); 
yt = amdemod(fit,fc,Fs); 

%% ========== FOURIER ============
N = 500; 
w = 2.*pi.*((-N/2) : ((N/2) -1)).*(Fs/N); 

% MENSAJE
mtf = fftshift(abs(fft(mt, N)));
mtf_norm = mtf/Fs;

% MODULADA
fitw = fftshift(abs(fft(fit, N)));
fitw_norm = fitw/Fs;

% y(t)
ytw = fftshift(abs(fft(yt, N)));
ytw_norm = ytw/Fs;
%% ==========INCISO A==================

figure(1)
plot(t,mt,'m','LineWidth',1)
ylabel("m(t)")
xlabel("t [s]")

%% =========INCISO B) ===================

figure(2)
plot(t,fit,'m','LineWidth',1)

ylabel("φ(t)")
xlabel("t [s]")

%% ========INCISO B)1 ===========
figure(3)
hold on; 
plot(t,fit,'m','LineWidth',1)
plot(t,mt,'r','LineWidth',1)
plot(t,-mt,'r','LineWidth',1)

ylabel("φ(t)")
xlabel("t [s]")

%% ========INCISO C) =========

figure(4)
plot(t,yt,'m','LineWidth',1); 

ylabel("y(t)")
xlabel("t [s]")

%% =======INCISO D) ==========

figure(5)
subplot(2,1,1)
plot(t,mt,'m','LineWidth',1)

ylabel("m(t)")
xlabel("t [s]")

subplot(2,1,2)
plot(t,yt,'m','LineWidth',1); 

ylabel("y(t)")
xlabel("t [s]")

saveas(gcf, "P2-imgs/inciso-d.png")

%% =========II GRAFICAR ESPECTROS =======
%% ==============INCISO E========
figure(6)
plot(w,mtf_norm); 
ylabel("|m(w)|")
xlabel("w [rad/s]")

%% =============INCISO F==========

figure(7)
plot(w,fitw_norm); 

ylabel("|φ(w)|")
xlabel("w [rad/s]")
%% ==============INCISO G=========
figure(8)
plot(w,ytw_norm,'m','LineWidth',1)

ylabel("|y(w)|")
xlabel("w [rad/s]")
%% ===============COMPARACION=======
figure(9)
subplot(2,1,1)
plot(w,mtf_norm); 

ylabel("|m(w)|")
xlabel("w [rad/s]")

subplot(2,1,2)
plot(w,ytw_norm)

ylabel("|y(w)|")
xlabel("w [rad/s]")

saveas(gcf, "P2-imgs/inciso-h.png")

%% ===III REPETIR I Y II camiando m(t) = Cos(200pit) Xc(t) =
%cos(100pit) 

fc = 500;
ts = 1/10000;
Fs = 1/ts;

t = -0.01: ts :0.01;  

mt = cos(200.*pi.*t); 

%% ========== MOD Y DEMOD ===========
fit = ammod(mt,fc,Fs); 
yt = amdemod(fit,fc,Fs); 

%% ========== FOURIER ============
N = 500; 
w = 2.*pi.*((-N/2) : ((N/2) -1)).*(Fs/N); 

% MENSAJE
mtf = fftshift(abs(fft(mt, N)));
mtf_norm = mtf/Fs;

% MODULADA
fitw = fftshift(abs(fft(fit, N)));
fitw_norm = fitw/Fs;

% y(t)
ytw = fftshift(abs(fft(yt, N)));
ytw_norm = ytw/Fs;
%% ==========INCISO A==================

figure(11)
plot(t,mt,'m','LineWidth',1)
ylabel("m(t)")
xlabel("t [s]")

saveas(gcf, "P2-imgs/inciso-3a.png")

%% =========INCISO B) ===================

figure(12)
plot(t,fit,'m','LineWidth',1)

ylabel("φ(t)")
xlabel("t [s]")

saveas(gcf, "P2-imgs/inciso-3b.png")

%% ========INCISO B)1 ===========
figure(13)
hold on; 
plot(t,fit,'m','LineWidth',1)
plot(t,mt,'r','LineWidth',1)
plot(t,-mt,'r','LineWidth',1)

ylabel("φ(t)")
xlabel("t [s]")

saveas(gcf, "P2-imgs/inciso-3b-1.png")

%% ========INCISO C) =========

figure(14)
plot(t,yt,'m','LineWidth',1); 

ylabel("y(t)")
xlabel("t [s]")

saveas(gcf, "P2-imgs/inciso-3c.png")

%% =======INCISO D) ==========

figure(15)
subplot(2,1,1)
plot(t,mt,'m','LineWidth',1)

ylabel("m(t)")
xlabel("t [s]")

subplot(2,1,2)
plot(t,yt,'m','LineWidth',1); 

ylabel("y(t)")
xlabel("t [s]")

saveas(gcf, "P2-imgs/inciso-3d.png")

%% =========II GRAFICAR ESPECTROS =======
%% ==============INCISO E========
figure(16)
plot(w,mtf_norm); 
ylabel("|m(w)|")
xlabel("w [rad/s]")

saveas(gcf, "P2-imgs/inciso-3e.png")

%% =============INCISO F==========

figure(17)
plot(w,fitw_norm); 

ylabel("|φ(w)|")
xlabel("w [rad/s]")

saveas(gcf, "P2-imgs/inciso-3f.png")

%% ==============INCISO G=========
figure(18)
plot(w,ytw_norm,'m','LineWidth',1)

ylabel("|y(w)|")
xlabel("w [rad/s]")

saveas(gcf, "P2-imgs/inciso-3g.png")

%% ===============COMPARACION=======
figure(19)
subplot(2,1,1)
plot(w,mtf_norm); 

ylabel("|m(w)|")
xlabel("w [rad/s]")

subplot(2,1,2)
plot(w,ytw_norm)

ylabel("|y(w)|")
xlabel("w [rad/s]")

saveas(gcf, "P2-imgs/inciso-3h.png")
