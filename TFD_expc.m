% Comprendre les résultats de la fonction fft de Octave
% Illustration d'un signal complexe
% Exponentielle complexe => spectre limité à une raie
% Ici le premier échantillon correspond à n = 0

clear ;
clf ;

% Exponentielle complexe

f0 = 1 ;                % fréquence du signal
fe = 25*f0 ;            % fréquence échantillonnage
Te = 1/fe ;
N = 100 ;
t = (0:N-1)*Te ;

e = exp(2*pi*j*f0*t) ;  % i ou j : imaginaire pur
%E = fft (e) ;
[E f] = TFD(e, fe) ;

subplot (2, 1, 1) ;
h_obj = stem (t,real(e)) ;
ylim ([-1.2 1.2]) ;
set (h_obj, 'markersize', 4) ;
my_title ('Exponentielle complexe : partie réelle') ;
my_xlabel ('Temps (s)') ;
subplot (2, 1, 2) ;
h_obj = stem (t, imag(e)) ;
ylim ([-1.2 1.2]) ;
set (h_obj, 'markersize', 4) ;
my_title ('Exponentielle complexe : partie imaginaire') ;
my_xlabel ('Temps (s)') ;

% Transformée de Fourier discrète : partie imaginaire nulle

input ('Figure suivante ? ') ;
clf
h_obj = stem (f, abs(E)) ;
set (h_obj, 'markersize', 2) ;
my_title ('TFD de exp(j*n*w0) : module') ;
set_ylim (abs(E)) ;
my_xlabel ('Fréquence (Hz)') ;
set(gca,'XTick',[-10 -5 0 1 5 10])

input ('Figure suivante ? ') ;
clf ;
subplot (2, 2, 1) ;
h_obj = stem (f, abs(E)) ;
set_ylim (abs(E)) ;
set (h_obj, 'markersize', 2) ;
my_title ('TFD de exp(j*n*w0) : module') ;
subplot (2, 2, 2) ;
h_obj = stem (f, angle(E)) ;
ylim ([-pi pi]) ;
set (h_obj, 'markersize', 2) ;
my_title ('TFD de exp(j*n*w0)) : phase') ;
subplot (2, 2, 3) ;
h_obj = stem (f, real(E)) ;
set_ylim (real(E)) ;
set (h_obj, 'markersize', 2) ;
my_title ('TFD de exp(j*n*w0)) : partie réelle') ;
subplot (2, 2, 4) ;
h_obj = stem (f, imag(E)) ;
set (h_obj, 'markersize', 2) ;
my_title ('TFD de exp(j*n*w0) : partie imaginaire') ;


