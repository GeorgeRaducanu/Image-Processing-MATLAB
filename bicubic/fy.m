function r = fy(f, x, y)
    % =========================================================================
    % Aproximeaza derivata fata de y a lui f in punctul (x, y).
    % =========================================================================
    
    % TODO: Calculeaza derivata fata de y conform formulei diferentelor finite.
    [m, n] = size(f);
    r = 0;
    if  y >= 2 && y <= n-1
      r = (f(x, y+1) - f(x, y-1) )/2;
    endif
endfunction