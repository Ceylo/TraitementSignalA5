% Exercice 2 du TD de preparation de 2013
% =======================================

clear
clf

% Lecture du fichier et construction base de temps

load "TD_analyse_filtre_2.mat" ;
N = length(x) ;
t = (0:N-1)/fe ;

% Allures temporelles des signaux d'entree et de sortie

hold on
plot(t, x, 'b') ;
plot(t, y, 'r') ;
my_title ('Allure temporelle des deux signaux', 13) ;
my_xlabel ('Temps (s)') ;
legend ('x','y') ;
hold off

% Spectre de frequence (amplitude + phase) pour les 2 signaux
input ('Figure suivante ? ') ;
clf
hold on
[X fx] = TFD(x, fe, N);
[Y fy] = TFD(y, fe, N);

plot(fx, abs(X), 'b');
my_title ('Spectre de frequence du signal d entree x : amplitude', 13) ;
my_xlabel ('Frequence (Hz)') ;
legend ('x') ;
hold off

input ('Figure suivante ? ') ;
clf
hold on
plot(fx, angle(X), 'b');
my_title ('Spectre de frequence du signal d entree x : phase', 13) ;
my_xlabel ('Frequence (Hz)') ;
legend ('x') ;
hold off

input ('Figure suivante ? ') ;
clf
hold on
plot(fy, abs(Y), 'r');
my_title ('Spectre de frequence du signal de sortie y : amplitude', 13) ;
my_xlabel ('Frequence (Hz)') ;
legend ('y') ;
hold off

input ('Figure suivante ? ') ;
clf
hold on
plot(fy, angle(Y), 'r');
my_title ('Spectre de frequence du signal de sortie y : phase', 13) ;
my_xlabel ('Frequence (Hz)') ;
legend ('y') ;
hold off

% Densites spectrales des deux signaux

spectre_x = spectral_xdf(x,'rectangle',0.01) ;
[psd, f_psd] = psd_shift(spectre_x, fe) ;
psd_x = abs(psd) ;
spectre_y = spectral_xdf(y,'rectangle',0.01) ;
[psd, f_psd] = psd_shift(spectre_y, fe) ;
psd_y = abs(psd) ;

input ('Figure suivante ? ') ;
clf
hold on
plot (f_psd, psd_x,'b') ;
plot (f_psd, psd_y,'r') ;
set_ymax (psd_y, 0.15) ;
my_title ('Densites spectrales des signaux', 13) ;
my_xlabel ('Frequence (Hz)') ;
legend ('x','y') ;
hold off

% Estimation de la fonction de transfert du filtre

Hxy = psd_y./psd_x ;

input ('Figure suivante ? ') ;
clf
plot (f_psd, Hxy, 'r') ;
my_title ('Estimation de la fonction de transfert du filtre', 13) ;
my_xlabel ('Frequence (Hz)') ;
