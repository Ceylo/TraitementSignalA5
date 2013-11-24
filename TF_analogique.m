% Transformée de Fourier avec spectre centré
% ==========================================

% "normalisation analogique" et "correction de phase"
% ===================================================

% Si omis fe = 1
% Si omis N = length (x)
% Si omis t0 = 0 (origine des temps pour fft)

function [X f] = TF_analogique (x, fe, N, t0)
  
  if (nargin() == 1)
    fe = 1 ;
    N = length(x) ;
  endif
  if (nargin() == 2)
    N = length(x) ;
  endif

% Transformée de Fourier centrée et "normalisée"

  X = fft(x,N) ;
  X = fftshift(X)/fe ;
  
% Domaine en fréquence correspondant (corrigé le 10/11/2012)

  nu = ((0:N-1)/N) ;
  n = ceil(N/2) ;
  f(1:N-n) = nu(n+1:N)-1 ;
  f(N-n+1:N) = nu(1:n) ;
  f = f*fe ;
  
% Correction de phase si t0 en argument

  if (nargin() == 4)
    cor_phase = exp(-j*2*pi*t0*f) ;
    X = X.*cor_phase ;
  endif
  
endfunction