% Transformée de Fourier discrète d'une porte unitaire
% A comparer avec cours : chapitre 11 - paragraphe B-4

clear
clf

f0 = 1 ;                                        % choix d'unité

% Porte unitaire de largeur M

N = 65 ;
M = 17 ;
offset = -8 ;
p = zeros(1,N) ;
n0 = ceil((N-M)/2 + 1) ;
n1 = n0+M-1 ;
xn = 1-n0+offset:N-n0+offset ;
p(n0:n1) = 1 ;

fig = stem (xn, p) ;
set (fig, 'markersize', 5) ;
text = sprintf ('Porte unitaire de largeur %d', M) ;
my_title (text) ;
set_ymax (p) ;
xlim([-35;35]);

[P f] = TFD(p, f0, N, xn(1)) ;              % f : fréquence réduite

input ('Figure suivante ? ') ;

fig = stem (f, abs(P)) ;
xlim([0; 0.5]);
set_ymax (abs(P)) ;
my_title ("TFD : module") ;

input ('Figure suivante ? ') ;

fig = stem (f, angle(P)) ;
xlim([0; 0.5]);
set_ymax (angle(P)) ;
my_title ("TFD : phase") ;

