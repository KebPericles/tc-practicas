clearvars;
%% P9. Teorema de muestreo

t0 = -1;
tf = 11;
ts = 1/100;
fs = 1/ts;

t = t0:ts:tf;
N = 2 * length(t);
f = ((-N/2) : ((N/2) -1)).*(fs/N);

NM_array = [3 6 11 21 41 101];

figure(1)
layout = tiledlayout(2,3, "TileSpacing","compact");
title(layout,"f(t) reconstruida")
ylabel(layout, "f(t)")
xlabel(layout, "t [s]")
layout.XLabel.FontSize = 13;
layout.XLabel.FontWeight = "bold";
layout.YLabel.FontSize = 13;
layout.YLabel.FontWeight = "bold";
for nm_i = 1:6
    nm = NM_array(nm_i);
    % Constantes variables respecto al número de muestras
    T = (10)/(nm - 1); % T
    fs_T = 1/T;
    wm = pi/T; % Teorema de muestreo aplicado para obtener la frecuencia máxima del mensaje a reconstruir a partir de sus muestras
    
    t_muestras = 0:T:10;
    f_t_muestras = 6 * exp(-t_muestras/10);
    
    % Reconstrucción
    
    nexttile
    hold on
    
    f_t = 0;
    for n = 0:length(t_muestras)-1
        n_sam_t = f_t_muestras(n+1) .* ( sinc(wm.*(t-(n*T))./pi) );
        f_t = f_t + n_sam_t;
    
        plot(t,n_sam_t)
    end
    
    plot(t,f_t,Color="red", LineWidth=3)
    title("NM = " + nm)
    grid on
end