function r = fx(f, x, y)
    % =========================================================================
    % Aproximeaza derivata fata de x a lui f in punctul (x, y).
    % =========================================================================

    % TODO: Calculeaza derivata fata de x conform formulei diferentelor finite.
    [m, n] = size(f);
    r = 0;
    if x >= 2 && x <= m-1
      r = (f(x+1, y) - f(x-1, y) )/2;
    endif
    
endfunction