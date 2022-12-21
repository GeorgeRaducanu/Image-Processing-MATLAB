function [Ix, Iy, Ixy] = precalc_d(I)
    % =========================================================================
    % Functia calculeaza matricile Ix, Iy si Ixy corespunzatoare derivatelor imaginii
    % =========================================================================
    
    % Aflam dimensiunea imaginii si tipul ei
    [m n nr_colors] = size(I);
    
    % TODO: Tranforma matricea I in double.
    % Ii dam cast la double pentru o mai mare rigoare a calculelor
    I = double(I);
    % Initializam matricele Ix, Iy si Ixy cu 0
    Ix = zeros(m, n);
    Iy = zeros(m, n);
    Ixy = zeros(m, n);
    % Le dam cast la double pentru o mai mare acuratete a calculelor
    Ix = double(Ix);
    Iy = double(Iy);
    Ixy = double(Ixy);
    % TODO: Calculeaza matricea cu derivate fata de y Ix.
    for i = 1:m
      for j = 1:n
        Ix(i, j) = fy(I, i, j);
       
      endfor
    endfor
    % TODO: Calculeaza matricea cu derivate fata de x Iy.
    for i = 1:m
      for j = 1:n
        Iy(i, j) = fx(I, i, j);
      endfor
    endfor
    % TODO: Calculeaza matricea cu derivate fata de xy Ixy.
    for i = 1:m
      for j = 1:n
        Ixy(i, j) = fxy(I, i, j);
      endfor
    endfor
    %Am terminat functia
endfunction
