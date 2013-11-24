% Transformée de Fourier discrète d'une fonction cosinus
% A comparer avec cours : chapitre 11 - paragraphe B-4
% Ici le premier échantillon correspond à n = 0

clear
clf

% Fonction cosinus

N = 41 ;
n = 0:N-1 ;
w0 = pi/4 ;
c = cos(n*w0) ;

fig = stem (n, c) ;
set (fig, 'markersize', 5) ;
set_ylim (c) ;
my_title ('cos(n*\omega_0) avec \omega_0 = \pi/4') ;

input ('Figure suivante ? ') ;
[C f] = TFD (c, 1, 256) ;                       % 256 points pour tracé continu de TFD
plot (f, abs(C)) ;
set_ymax (abs(C)) ;
my_title ('TFD de cos(n*\omega_0) sur 5 périodes') ;
my_xlabel ('Fréquence réduite') ;