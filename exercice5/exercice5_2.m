% HAUDEGAND & SOLTIC
% Etude d'un filtre défini par sa fonction de transfert en z :

%          M
%         sum b(k+1) z^-k
%         k=0
% H(z) = -----------------
%          N
%         sum a(k+1) z^-k
%         k=0

% Ici définition du filtre par sa fonction de transfert en z
% A : coefficients du dénominateur (premier terme -> degré 0)
% B : coefficients du numérateur (premier terme -> degré 0)

clear
clf

fe = 1 ;                                % Fréquence d'échantillonnage

A = [2] ;
B = [1 1] ;

[H, w] = freqz(B,A) ;                   % w : pulsation entre 0 et pi
nu = w/(2*pi) ;                         % Fréquence réduite
f = nu*fe ;                             % Fréquence

plot(nu,abs(H)) ;
set_ymax(abs(H)) ;
my_title("Diagramme de gain", 13) ;
my_xlabel("Fréquence réduite") ;

input ("Figure suivante ? ") ;
plot(nu,20*log10(abs(H))) ;
my_title("Diagramme de gain en dB", 13) ;
my_xlabel("Fréquence réduite") ;

input ("Figure suivante ? ") ;
plot(nu,angle(H)) ;
my_title("Diagramme de phase (en radians)",13) ;
my_xlabel("Fréquence réduite") ;

input ("Figure suivante ? ") ;
plot(nu,angle(H)*180/pi) ;
my_title("Diagramme de phase (en degrés)",13) ;
my_xlabel("Fréquence réduite") ;

% Visualisation des zéros et des pôles de la fonction de transfert en z

input ("Figure suivante ? ") ;
zplane(B, A) ;
set (findobj (gcf, '-property', 'markersize'), 'markersize', 7) ;
my_title("Zéros (o) et pôles (x)", 13) ;

% Réponse impulsionnelle

N = 64 ;
n0 = N/2 ;
n_min = 1-n0 ;
n_max = N-n0 ;
n = n_min:n_max ;
d = zeros(1,N) ;
d(n0) = 1 ;

h = filter (B, A, d) ;

input ("Figure suivante ? ") ;
h_obj = stem (n,h) ;
set_ylim(h) ;
set (h_obj, 'markersize', 5) ;
my_title("Réponse impulsionnelle", 13) ;

% Réponse indicielle

u(1:n0-1) = zeros(1,n0-1) ;
u(n0:N) = ones(1,N-n0+1) ;

i = filter(B,A,u) ;

input ("Figure suivante ? ") ;
h_obj = stem (n,i) ;
set_ylim(i) ;
set (h_obj, 'markersize', 5) ;
my_title("Réponse indicielle", 13) ;