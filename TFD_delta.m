% Transformée de Fourier discrète : échantillon unité
% Ici le premier échantillon correspond à n = 0

clear
clf

% Echantillon unité : ici amplitude, pas de référence possible en fréquence

f0 = 1 ;                % fréquence du signal (ici choix d'unité uniquement)

N = 10 ;
d = zeros(1,N) ;
d(1) = 1 ;
xn = 0:N-1 ;                            % pour affichage des abcisses
[D w] = TFD(d, 360) ;

fig = stem (xn, d) ;
set (fig, 'markersize', 5) ;
axis ([-1 N 0 1.1]) ;
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
set (h_obj, 'markersize', 5) ;
xlim ([-200 200]) ;
set(gca,'XTick',[-180 -90 0 90 180])
my_title ('TFD de delta(n) : phase') ;
subplot (2, 2, 3) ;
h_obj = stem (w, real(D)) ;
ylim ([0 1.2]) ;
set (h_obj, 'markersize', 5) ;
set (h_obj, 'markersize', 5) ;
xlim ([-200 200]) ;
set(gca,'XTick',[-180 -90 0 90 180])
my_title ('TFD de delta(n) : partie réelle') ;
subplot (2, 2, 4) ;
h_obj = stem (w, imag(D)) ;
set (h_obj, 'markersize', 5) ;
set (h_obj, 'markersize', 5) ;
xlim ([-200 200]) ;
set(gca,'XTick',[-180 -90 0 90 180])
my_title ('TFD de delta(n) : partie imaginaire') ;

% Echantillon unité retardé : effet uniquement sur la phase de TFD

N = 100 ;
d = zeros(1,N) ;
d(6) = 1 ;
xn = 0:N-1 ;
[D w] = TFD (d, 360) ;

input ('Figure suivante ? ') ;
clf
h_obj = stem (xn, d) ;
set (h_obj, 'markersize', 4) ;
ylim ([0 1.1]) ;
my_title ('delta(n-5)') ;

input ('Figure suivante ? ') ;
subplot (2, 2, 1) ;
h_obj = stem (w, abs(D)) ;
ylim ([0 1.2]) ;
set (h_obj, 'markersize', 2) ;
xlim ([-200 200]) ;
set(gca,'XTick',[-180 -90 0 90 180])
my_title ('TFD de delta(n-5) : module') ;
subplot (2, 2, 2) ;
h_obj = stem (w, angle(D)) ;
set_ylim (angle(D)) ;
set (h_obj, 'markersize', 2) ;
xlim ([-200 200]) ;
set(gca,'XTick',[-180 -90 0 90 180])
my_title ('TFD de delta(n-5) : phase') ;
subplot (2, 2, 3) ;
h_obj = stem (w, real(D)) ;
ylim ([-1.2 1.2]) ;
set (h_obj, 'markersize', 2) ;
xlim ([-200 200]) ;
set(gca,'XTick',[-180 -90 0 90 180])
my_title ('TFD de delta(n-5) : partie réelle') ;
subplot (2, 2, 4) ;
h_obj = stem (w, imag(D)) ;
ylim ([-1.2 1.2]) ;
set (h_obj, 'markersize', 2) ;
xlim ([-200 200]) ;
set(gca,'XTick',[-180 -90 0 90 180])
my_title ('TFD de delta(n-5) : partie imaginaire') ;
