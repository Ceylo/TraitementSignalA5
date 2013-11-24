% Transformée de Fourier discrète d'une porte unitaire
% A comparer avec cours : chapitre 11 - paragraphe B-4

clear
clf

f0 = 1 ;                                        % choix d'unité

% Porte unitaire de largeur M

N = 50 ;
M = 7 ;
p = zeros(1,N) ;
n0 = ceil((N-M)/2) ;
n1 = n0+M-1 ;
xn = 1-n0:N-n0 ;
p(n0:n1) = 1 ;

fig = stem (xn, p) ;
set (fig, 'markersize', 5) ;
text = sprintf ('Porte unitaire de largeur %d', M) ;
my_title (text) ;
set_ymax (p) ;

% TFD : module, puis phase

[P f] = TFD(p, f0, N, xn(1)) ;              % f : fréquence réduite
w = f*360 ;                                 % w : pulsation en degrés

input ('Figure suivante ? ') ;

fig = stem (w, abs(P)) ;
set_ymax (abs(P)) ;
set (fig, 'markersize', 5) ;
xlim ([-200 200]) ;
set(gca,'XTick',[-180 -90 0 90 180]) 
text = sprintf ('TFD porte unitaire de largeur %d : module', M) ;
my_title (text) ;
my_xlabel ('\omega en degrés') ;

input ('Figure suivante ? ') ;

fig = stem (w, angle(P)) ;
set_ylim (angle(P)) ;
set (fig, 'markersize', 5) ;
%xlim ([-pi pi]) ;
set(gca,'XTick',[-180 -90 0 90 180]) 
text = sprintf ('TFD porte unitaire de largeur %d : phase', M) ;
my_title (text) ;
my_xlabel ('\omega en degrés') ;
