% Permet de modifier la fonte et la taille d'une l�gence axe des absices
% ======================================================================

% Par d�faut : font_size = 11

function h_obj = my_xlabel (texte, font_size)
  if (nargin() == 1)
    font_size = 11 ;
  endif
  h_obj = xlabel (texte) ;
  set (h_obj, 'fontname', 'times new roman') ;
  set (h_obj, 'fontsize', font_size) ;
endfunction