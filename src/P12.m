clearvars;
%% I

f1 = 0;
f2 = 2  * 10^6;
fs = 20 * 10^6;
tp = 25 * 10^-6;
t = 0:1/fs:tp;

% Fourier
N = 4 * length(t);
f = ((-N/2) : ((N/2) -1)).*(fs/N);

figure_number = 1;
for snr = [1 5 10 20]
      
    figure(figure_number)
    layout = tiledlayout(4,2);
    
    % a)
    y_t = chirp(t, f1, tp, f2);
    
    nexttile(1)
    plot(y_t)
    
    % b)
    
    g_t = lagmatrix(y_t, 150);
    g_t(1:150) = 0;
    
    nexttile(3)
    plot(g_t)
    
    % II
    % c)
    
    x_t = awgn(g_t, 20);
    
    nexttile(5)
    plot(x_t)
    
    % d)
    rxx = crosscorr(x_t,y_t,400);
    
    nexttile(7,[1 2])
    plot((-400:400),rxx)
    
    % e)
    
    y_f = fftshift(abs(fft(y_t,N)))./length(t);
    
    nexttile(2)
    plot(f, y_f)
    
    % f)
    g_f = fftshift(abs(fft(g_t,N)))./length(t);
    
    nexttile(4)
    plot(f, g_f)
    
    % g)
    x_f = fftshift(abs(fft(x_t,N)))./length(t);
    
    nexttile(6)
    figure_number = figure_number + 1;
    plot(f, x_f)
    
    figure_number = figure_number + 1;
end