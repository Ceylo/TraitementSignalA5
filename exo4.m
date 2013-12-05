clear;
clf;

fe = 8000;
fcut_start = 1000 / (fe * 2);
fcut_end = (fcut_start + 200) / (fe * 2);
db1 = 1;
db2 = 40;

[n wn] = buttord(fcut_start, fcut_end, db1, db2);
[B, A] = butter(n, wn);

[H, w] = freqz(B,A) ;                   % w : pulsation entre 0 et pi
nu = w/(2*pi) ;                         % Frequence reduite
f = nu*fe ;                             % Frequence

plot(nu,abs(H)) ;
set_ymax(abs(H)) ;
my_title("Diagramme de gain", 13) ;
my_xlabel("Frequence reduite") ;

input ("Figure suivante ? ") ;
plot(nu,20*log10(abs(H))) ;
my_title("Diagramme de gain en dB", 13) ;
my_xlabel("Frequence reduite") ;

input ("Figure suivante ? ") ;
plot(nu,angle(H)) ;
my_title("Diagramme de phase (en radians)",13) ;
my_xlabel("Frequence reduite") ;

input ("Figure suivante ? ") ;
plot(nu,angle(H)*180/pi) ;
my_title("Diagramme de phase (en degres)",13) ;
my_xlabel("Frequence reduite") ;

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

