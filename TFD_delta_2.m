% Transform�e de Fourier discr�te : �chantillon unit�
% Avec prise en compte de la num�rotation des �chantillons

clear
clf

% Echantillon unit� : ici amplitude, pas de r�f�rence possible en fr�quence

f0 = 1 ;                % fr�quence du signal (ici choix d'unit� uniquement)

N = 20 ;
d = zeros(1,N) ;
n0 = N/2 ;
d(n0) = 1 ;
xn = 1-n0:N-n0 ;                            % pour affichage des abcisses
[D f] = TFD(d, f0, N, xn(1)) ;              % f : fr�quence r�duite
w = f*360 ;                                 % w : pulsation en degr�s

fig = stem (xn, d) ;
set (fig, 'markersize', 5) ;
ylim ([0 1.1]) ;
my_title ('delta(n)') ;

% Affichage TFD, 4 plots : module, phase, parties r�elle et imaginaire

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
my_title ('TFD de delta(n) : partie r�elle') ;
subplot (2, 2, 4) ;
h_obj = stem (w, imag(D)) ;
set (h_obj, 'markersize', 5) ;
xlim ([-200 200]) ;
set(gca,'XTick',[-180 -90 0 90 180])
my_title ('TFD de delta(n) : partie imaginaire') ;