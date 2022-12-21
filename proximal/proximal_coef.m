function a = proximal_coef(f, x1, y1, x2, y2)
    % =========================================================================
    % Calculeaza coeficientii a pentru Interpolarea Proximala intre punctele
    % (x1, y1), (x1, y2), (x2, y1) si (x2, y2).
    % =========================================================================
    
    % TODO: Calculeaza matricea A.
    A = [1 x1 y1 x1*y1;1 x1 y2 x1*y2; 1 x2 y1 x2*y1; 1 x2 y2 x2*y2];
    % TODO: Calculeaza vectorul b.    
    b = [f(y1, x1); f(y2, x1); f(y1, x2); f(y2, x2)];
    % Dam cast la double pentru o mai mare acuratete
    A = cast(A, "double");
    b = cast(b, "double");
    % TODO: Calculeaza coeficientii.
    a = zeros(4, 1);
    a = cast(a, "double");
    a = A\b; % rezolva sistemul liniar cu functia built in \
endfunction
