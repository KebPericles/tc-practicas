clearvars;
%% P7. Modulación angular

fs = 10000;
ts = 1/fs;

t = 0:ts:0.1;
N = 2 * length(t);
f = ((-N/2) : ((N/2) -1)).*(fs/N);

%% 
figure1 = figure(1);
layout = tiledlayout(5, 2);
layout.TileSpacing = "compact";
layout.Padding = "loose";

layoutIzq = tiledlayout(layout, 5,1);
layoutIzq.Layout.Tile = 1;
layoutIzq.Layout.TileSpan = [5 1];

ylabel(layoutIzq, "$\varphi_{FM}(t)$", "Interpreter", "latex")
xlabel(layoutIzq, "t [s]", "Interpreter", "latex")

layoutDer = tiledlayout(layout, 5,1);
layoutDer.Layout.Tile = 2;
layoutDer.Layout.TileSpan = [5 1];

ylabel(layoutDer, "$|\mathcal{F}\{\varphi_{FM}(t)\}| [W]$", "Interpreter", "latex")
xlabel(layoutDer, "f [Hz]", "Interpreter", "latex")

figure2 = figure(2);

figure3 = figure(3);


betas = [0.2 1 5 10 50];
graphs_fourier = cell(5, 1);
for i = 1:5
    beta = betas(i);
    ancho_banda = (beta + 1) * 25 * 2;
    fc = 100 + ((beta + 1) * 25);
    lim_inferior = fc - ancho_banda * (1 / (2^(ancho_banda/1000)))/2;
    lim_superior = fc + ancho_banda * (1 / (2^(ancho_banda/1000)))/2;
    wc = 2*pi*fc;
    
    phi_fm_t = cos(wc .* t + beta .* sin(50 * pi .* t));

    nexttile(layoutIzq)
    plot(t, phi_fm_t)
    grid on
    yticks([-1 0 1])
    title("$\beta = " + beta + "$", "Interpreter","latex")

    % c) Fourier
    phi_fm_w = 2*pi.*fftshift(abs(fft(phi_fm_t,N)))./length(t);

    graphs_fourier{i} = nexttile(layoutDer);
    stem(f,phi_fm_w)
    
    title("$\beta = " + beta + "$", "Interpreter","latex")
    grid on
    ax = gca;
    ax.TickLabelInterpreter = 'latex';
    xlim([lim_inferior lim_superior])
    yticks([0 pi/4 pi/2 pi])
    yticklabels({"0", "$\pi/4$", "$\pi/2$", "$\pi$"})
end

graphs_fourier{1}.YLim = [0 pi+0.001];
graphs_fourier{3}.YLim = [0 pi/2+0.001];
graphs_fourier{5}.YLim = [0 pi/4+0.001];
graphs_fourier{5}.YTick = [0 pi/8 pi/4];
graphs_fourier{5}.YTickLabel = ["0" "$\pi/8$" "$\pi/4$"];

copyobj(layoutIzq,figure2);
copyobj(layoutDer,figure3);