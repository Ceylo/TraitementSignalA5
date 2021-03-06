% 
% w1 < w2 (passe bas)
% w1 > w2 (passe haut)
% w1 : bord de début de passe bande = 1 kHz
% w2 : bord de début de coupe bande = 1,2 kHz
% db1 : nombre de dB d’ondulation acceptables dans le filtre passe bande = 1 dB
% db2 : attenuation minimum en dB du filtre coupe bande = 40 dB
% 
% 
% butterworth:
% [n, wn] = buttord(w1, w2, dB1, dB2)  (doit etre normalisé sur fe/2, notamment w1 et w2)
% [B, A] = butter(n, wn) // filtre passe bas coupé à PI x Wc radians
% y = filter(B, A, s)
% 

clear;
clf;

fe = 8000;
fcut_start = 1000 / (fe / 2);
fcut_end = 1200 / (fe / 2);
db1 = 1;
db2 = 40;

[n wn] = buttord(fcut_start, fcut_end, db1, db2);
[B, A] = butter(n, wn);

[H, w] = freqz(B,A, 512, 8000) ;                   % w : pulsation entre 0 et pi

plot(w,20*log10(abs(H))) ;
my_title("Diagramme de gain en dB", 13) ;
my_xlabel("Frequence (Hz)") ;

% Visualisation des zeros et des poles de la fonction de transfert en z

input ("Figure suivante ? ") ;
zplane(B, A) ;
set (findobj (gcf, '-property', 'markersize'), 'markersize', 7) ;
my_title("Zeros (o) et poles (x)", 13) ;

% Reponse impulsionnelle (il est egalement possible d'utiliser impz)

N = 250 ;
n0 = N/2 ;
n_min = 1-n0 ;
n_max = N-n0 ;
n = n_min:n_max ;
d = zeros(1,N) ;
d(n0) = 1 ;

h = filter (B, A, d) ;

input ("Figure suivante ? ") ;
h_obj = plot (n,h) ;
set_ylim(h) ;
set (h_obj, 'markersize', 5) ;
my_title("Reponse impulsionnelle", 13) ;


% Q2: génération du signal composé de la somme de deux sinusoïdes à 800 Hz et 1.4 kHz, échantillonné à 8kHz.
compo_fe = 8000 ;		        % Fréquence déchantillonnage
compo_Te = 1/compo_fe ;
compo_t = 0:compo_Te:1 ;

compo_x = 0.2*sin(2*pi*800*compo_t); % sinusoide à 800 Hz
compo_x = compo_x.+0.2*sin(2*pi*1400*compo_t); % sinusoide à 1400 Hz

input ("Figure suivante ? ") ;
plot(compo_t, compo_x) ;
my_title ('Signal initial', 13) ;
my_xlabel ('Temps (s)') ;
set_ylim (compo_x) ;
xlim([0 0.1]);

% Spectre de fréquence du son généré
[P f] = TFD(compo_x, fe) ;              % f : fréquence réduite

input ('Figure suivante ? ') ;

fig = plot (f, abs(P)) ;
set_ymax (abs(P)) ;
xlim([0 2000]);
my_xlabel ('Frequence (Hz)') ;
my_title ("Spectre du signal compose'") ;


% Application de notre filtre
filtered = filter(B, A, compo_x);

input("Figure suivante ? ");
plot(compo_t, filtered) ;
my_title ('Signal filtre', 13) ;
my_xlabel ('Temps (s)') ;
set_ylim (filtered) ;
xlim([0 0.1]);

% Spectre de fréquence du son filtré
[P f] = TFD(filtered, fe) ;              % f : fréquence réduite

input ('Figure suivante ? ') ;

fig = plot (f, abs(P)) ;
set_ymax (abs(P)) ;
xlim([0 2000]);
my_xlabel ('Frequence (Hz)') ;
my_title ("Spectre du son filtre'") ;
