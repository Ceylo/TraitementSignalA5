% Transform�e de Fourier discr�te avec spectre centr�
% ===================================================

% x : signal num�rique
% fe : fr�quence d'�chantillonnage
% N : nombre d'�chantillons
% n0 : num�ro du premier �chantillon

% Si omis fe = 1
% Si omis N = length (x)
% Si n0 omis = 0

function [X f] = TFD (x, fe, N, n0)
  
  if (nargin() == 1)
    fe = 1 ;
    N = length(x) ;
  endif
  if (nargin() == 2)
    N = length(x) ;
  endif
  
% Transform�e de Fourier discr�te centr�e

  X = fft(x,N) ;
  X = fftshift(X) ;
  
% Domaine en fr�quence correspondant

  nu = ((0:N-1)/N) ;
  n = ceil(N/2) ;
  f(1:N-n) = nu(n+1:N)-1 ;
  f(N-n+1:N) = nu(1:n) ;
  f = f*fe ;
  
% Correction de phase si n0 en argument

  if (nargin() == 4)
    cor_phase = exp(-j*2*pi*n0*f) ;
    X = X.*cor_phase ;
  endif

endfunction