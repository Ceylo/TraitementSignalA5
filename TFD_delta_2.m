% Transformée de Fourier discrète : échantillon unité
% Avec prise en compte de la numérotation des échantillons

clear
clf

% Echantillon unité : ici amplitude, pas de référence possible en fréquence

f0 = 1 ;                % fréquence du signal (ici choix d'unité uniquement)

N = 20 ;
d = zeros(1,N) ;
n0 = N/2 ;
d(n0) = 1 ;
xn = 1-n0:N-n0 ;                            % pour affichage des abcisses
[D f] = TFD(d, f0, N, xn(1)) ;              % f : fréquence réduite
w = f*360 ;                                 % w : pulsation en degrés

fig = stem (xn, d) ;
set (fig, 'markersize', 5) ;
ylim ([0 1.1]) ;
my_title ('delta(n)') ;

% Affichage TFD, 4 plots : module, phase, parties réelle et imaginaire

input ('Figure suivante ? ') ;
subplot (2, 2, 1) ;
h_obj = stem (w, abs(D)) ;
ylim ([0 1.2]) ;
set (h_obj, 'markersize', 5) ;
xlim ([-200 200]) ;
set(gca,'XTick',[-180 -90 0 90 180]) 
my_title ('TFD de delta(n) : module') ;
subplot (2, 2, 2) ;
h_obj = stem (w, angle(D)) ;
ylim ([-pi pi]) ;
set (h_obj, 'markersize', 5) ;
xlim ([-200 200]) ;
set(gca,'XTick',[-180 -90 0 90 180])
my_title ('TFD de delta(n) : phase') ;
subplot (2, 2, 3) ;
h_obj = stem (w, real(D)) ;
ylim ([-1.2 1.2]) ;
set (h_obj, 'markersize', 5) ;
xlim ([-200 200]) ;
set(gca,'XTick',[-180 -90 0 90 180])
my_title ('TFD de delta(n) : partie réelle') ;
subplot (2, 2, 4) ;
h_obj = stem (w, imag(D)) ;
set (h_obj, 'markersize', 5) ;
xlim ([-200 200]) ;
set(gca,'XTick',[-180 -90 0 90 180])
my_title ('TFD de delta(n) : partie imaginaire') ;