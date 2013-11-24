% Modification de la position du cadre supérieur

function set_ymax (y, marge)
  
  if (nargin() == 1)
    marge = 0.05 ;
  endif
  
  ymin = 0. ;
  ymax = max(y) ;
  dy = (ymax-ymin)*marge ;
  ymax = ymax+dy ;
  ylim ([ymin ymax]) ;

endfunction