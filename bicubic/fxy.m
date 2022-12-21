function r = fxy(f, x, y)
    % =========================================================================
    % Aproximeaza derivata fata de x si y a lui f in punctul (x, y).
    % =========================================================================
    
    % TODO: Calculeaza derivata mixta conform formulei diferentelor finite.
    [m, n] = size(f);
    r = 0;
    if  x >= 2 && x <= m-1 && y >= 2 && y <= n-1
      r = (f(x+1, y+1) + f(x-1, y-1) - f(x+1, y-1) - f(x-1, y+1))/4;
    endif
endfunction