close all;
clearvars;
%% P7. Modulación angular

fs = 10000;
ts = 1/fs;

t = 0:ts:0.1;
N = 8 * length(t);
f = ((-N/2) : ((N/2) -1)).*(fs/N);

%% 
figure(1)
layout = tiledlayout(5, 2);

layoutIzq = tiledlayout(layout, 5,1);
layoutIzq.Layout.Tile = 1;
layoutIzq.Layout.TileSpan = [5 1];
xlabel(layoutIzq, "t [s]")

layoutDer = tiledlayout(layout, 5,1);
layoutDer.Layout.Tile = 2;
layoutDer.Layout.TileSpan = [5 1];
xlabel(layoutDer, "f [Hz]")

figure2 = figure(2);

figure3 = figure(3);

for beta = [0.2 1 5 10 50]
    fc = 100 + ((beta + 1) * 25);
    wc = 2*pi*fc;
    
    phi_fm_t = cos(wc .* t + beta .* sin(50 * pi .* t));

    nexttile(layoutIzq)
    plot(t, phi_fm_t)

    % c) Fourier
    phi_fm_w = 2*pi.*fftshift(abs(fft(phi_fm_t,N)))./length(t);

    nexttile(layoutDer)
    stem(f,phi_fm_w)
    xlim([0 max(wc)/3])
end

copyobj(layoutIzq,figure2);
copyobj(layoutDer,figure3);