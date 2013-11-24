% Filtre passe-bas, tel que vu en cours, pour filtrer une gamme et un fond

clear
clf

disp ('Construction du signal : long')
fflush(stdout) ;

fe = 44100 ;		        % Fréquence déchantillonnage
Te = 1/fe ;
dt1 = 0.5 ;                     % Intervalle entre deux notes
dt2 = 0.5 ;                     % Durée d'une note
nb = 3 ;                        % Nombre de notes jouées
t_max = (nb*(dt1+dt2)+dt1) ;
t = 0:Te:t_max ;

% Description de la gamme

a = 1/12 ;
pas_1 = 2^a ;                   % Série géométique de pas racine 12-ième de 2
pas_2 = pas_1^2 ;
la = 440 ;                      % Fréquence de référence
sol = la/pas_2 ;
fa = sol/pas_2 ;
mi = fa/pas_1 ;
re = mi/pas_2 ;
do3 = re/pas_2 ;
si = la*pas_2 ;
f(1) = 1000 ;
f(2) = 3000 ;
f(3) = 43500 ;

% Signal : un la permanent de fond et 8 notes

x = 0 * sin(2*pi*t);
%x = 0.8*sin(2*pi*la*t) ;

n1 = floor(dt1*fe) ;
dn1 = floor(dt1*fe) ;
dn2 = floor(dt2*fe) ;
for i=1:nb
  n2 = n1+dn1 ;
  dn = n1:n2 ;
  x(dn) = x(dn).+0.8*sin(2*pi*f(i)*dn*Te) ;
  n1 = n2+dn2 ;
endfor

% Description du filtre passe-bas

fc = (sol+la)/2 ;       % Coupure entre sol et la
N = 4097 ;              % Nombre de points du noyau
Nc = floor(N/2) ;
n = 0:N-1 ;
nu_c = fc/fe ;		% Fréquence réduite de coupure
v = 2*nu_c*(n-Nc) ;
h = 2*nu_c*sinc(v) ;
nh = n-Nc ;

% Pondération de Blackman

w = 0.42.-(0.5*cos(2*pi*n/N))+(0.08*cos(4*pi*n/N)) ;
h = w.*h ;

% Visualisation temporelle du signal initial

plot(t, x) ;
my_title ('Signal initial', 13) ;
my_xlabel ('Temps (s)') ;
set_ylim (x) ;
wavwrite(x',fe,16,"gamme_1.wav") ;

% Signal filtré

y = filter(h,1,x) ;                    % Permet d'avoir y de même longueur que x et t
input ('Figure suivante (long également) ? ') ;
plot(t,y) ;
my_title ('Signal filtré', 13) ;
my_xlabel ('Temps (s)') ;
set_ylim (y) ;

wavwrite(y',fe,16,"gamme_2.wav") ;

% Spectre du signal initial : zoom entre 0 et 1000 Hz

spectre_x = fft(x) ;
N = length(spectre_x) ;
f = (0:N-1)/N*fe ;
f_max = 3500 ; % on peut afficher jusqu'à fe / 2 mais il n'y a rien d'intéressant après 3000 Hz
n_max = floor(f_max*N/fe) ;
dn = 1:n_max ;
input ('Figure suivante ? ') ;
plot(f(dn),abs(spectre_x(dn))) ;
set_ymax(abs(spectre_x(dn))) ;
set (gca,'xtick',[0:100:f_max]) ;
my_xlabel("Fréquence (Hz)") ;
my_title("Spectre du signal initial",13) ;

% Spectre du signal filtré : zoom entre 0 et 1000 Hz

spectre_y = fft(y) ;
input ('Figure suivante ? ') ;
plot(f(dn),abs(spectre_y(dn))) ;
set_ymax (abs(spectre_y(dn))) ;
set (gca,'xtick',[0:100:f_max]) ;
my_xlabel("Fréquence (Hz)") ;
my_title("Spectre du signal filtré",13) ;
