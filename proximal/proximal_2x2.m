function out = proximal_2x2(f, STEP)
    % ===================================================================================
    % Aplica Interpolare Proximala pe imaginea 2 x 2 f cu puncte intermediare echidistante.
    % f are valori cunoscute în punctele (1, 1), (1, 2), (2, 1) ?i (2, 2).
    % Parametrii:
    % - f = imaginea ce se va interpola;
    % - STEP = distanta dintre doua puncte succesive.
    % ===================================================================================
    % La acest cod comenteriile sunt cele din schelet fiind suficient de relevante
    % TODO: Defineste coordonatele x si y ale punctelor intermediare.
    x_int = 1:STEP:2;
    y_int = 1:STEP:2;
    % Se afl? num?rul de puncte.
    n = length(x_int);

    % TODO: Cele 4 puncte încadratoare vor fi aceleasi pentru toate punctele din interior.
    A11 = f(1, 1);
    A12 = f(1, 2);
    A21 = f(2, 1);
    A22 = f(2, 2);
    % TODO: Initializeaza rezultatul cu o matrice nula n x n.
    out = zeros(n, n);
    % Se parcurge fiecare pixel din imaginea finala.
    for i = 1 : n
        for j = 1 : n
            % TODO: Afla cel mai apropiat pixel din imaginea initiala.
            if 2 * i < n + 1
              v_i = 1;
            else
              v_i = 2;
            endif
            if 2 * j < n + 1
              v_j = 1;
            else
              v_j = 2;
            endif
            % TODO: Calculeaza pixelul din imaginea finala.
            out(i, j) = f(v_i, v_j);
        endfor
    endfor

endfunction