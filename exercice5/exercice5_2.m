% HAUDEGAND & SOLTIC
% Etude d'un filtre d�fini par sa fonction de transfert en z :

%          M
%         sum b(k+1) z^-k
%         k=0
% H(z) = -----------------
%          N
%         sum a(k+1) z^-k
%         k=0

% Ici d�finition du filtre par sa fonction de transfert en z
% A : coefficients du d�nominateur (premier terme -> degr� 0)
% B : coefficients du num�rateur (premier terme -> degr� 0)

clear
clf

fe = 1 ;                                % Fr�quence d'�chantillonnage

A = [2] ;
B = [1 1] ;

[H, w] = freqz(B,A) ;                   % w : pulsation entre 0 et pi
nu = w/(2*pi) ;                         % Fr�quence r�duite
f = nu*fe ;                             % Fr�quence

plot(nu,abs(H)) ;
set_ymax(abs(H)) ;
my_title("Diagramme de gain", 13) ;
my_xlabel("Fr�quence r�duite") ;

input ("Figure suivante ? ") ;
plot(nu,20*log10(abs(H))) ;
my_title("Diagramme de gain en dB", 13) ;
my_xlabel("Fr�quence r�duite") ;

input ("Figure suivante ? ") ;
plot(nu,angle(H)) ;
my_title("Diagramme de phase (en radians)",13) ;
my_xlabel("Fr�quence r�duite") ;

input ("Figure suivante ? ") ;
plot(nu,angle(H)*180/pi) ;
my_title("Diagramme de phase (en degr�s)",13) ;
my_xlabel("Fr�quence r�duite") ;

% Visualisation des z�ros et des p�les de la fonction de transfert en z

input ("Figure suivante ? ") ;
zplane(B, A) ;
set (findobj (gcf, '-property', 'markersize'), 'markersize', 7) ;
my_title("Z�ros (o) et p�les (x)", 13) ;

% R�ponse impulsionnelle

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
my_title("R�ponse impulsionnelle", 13) ;

% R�ponse indicielle

u(1:n0-1) = zeros(1,n0-1) ;
u(n0:N) = ones(1,N-n0+1) ;

i = filter(B,A,u) ;

input ("Figure suivante ? ") ;
h_obj = stem (n,i) ;
set_ylim(i) ;
set (h_obj, 'markersize', 5) ;
my_title("R�ponse indicielle", 13) ;