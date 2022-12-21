function A = bicubic_coef(f, Ix, Iy, Ixy, x1, y1, x2, y2)
    % =========================================================================
    % Calculeaza coeficientii de Interpolare Bicubica pentru 4 puncte al?turate
    % =========================================================================

    % TODO: Calculeaz? matricile intermediare.
     B = [1 0 0 0; 0 0 1 0; -3 3 -2 -1; 2 -2 1 1];
     % B matricea de coef din stanga
     D = B'; % D matricea de coeficienti din dreapta
     C = [f(y1, x1) f(y2, x1) Iy(y1, x1) Iy(y2, x1);
          f(y1, x2) f(y2, x2) Iy(y1, x2) Iy(y2, x2);
          Ix(y1, x1) Ix(y2, x1) Ixy(y1, x1) Ixy(y2, x1);
          Ix(y1, x2) Ix(y2, x2) Ixy(y1, x2) Ixy(y2, x2)];
    % C Matricea din mijloc care depinde de valorile imaginii
    % TODO: Matricile intermediare la double pentru o acuratete corecta.
    cast(B, "double");
    cast(C, "double");
    cast(D, "double");
    % TODO: Calculeaza matricea finala
    A = B*C*D;
endfunction