function R = proximal_rotate(I, rotation_angle)
    % =========================================================================
    % Roteste imaginea alb-negru I de dimensiune m x n cu unghiul rotation_angle,
    % aplicând Interpolare Proximala.
    % rotation_angle este exprimat în radiani.
    % =========================================================================
    % se afla dimensiunile si tipul imaginii
    [m n nr_colors] = size(I);
    % Cast la double pentru o acuratete mai mare a calculelor
    I = cast(I, "double");
    
    if nr_colors > 1
        R = -1;
        return
    endif

    % Obs: In continuare comentarile sunt cele din schelet
    % Atunci când se aplica o scalare, punctul (0, 0) al imaginii nu se va deplasa.
    % În Octave, pixelii imaginilor sunt indexati de la 1 la n.
    % Daca se lucreaza în indici de la 1 la n si se inmultesc x si y cu s_x respectiv s_y,
    % atunci originea imaginii se va deplasa de la (1, 1) la (sx, sy)!
    % De aceea, trebuie lucrat cu indici în intervalul [0, n - 1].

    % TODO: Calculeaza cosinus si sinus de rotation_angle.
    C = cos(rotation_angle);
    S = sin(rotation_angle);
    % TODO: Initializeaza matricea finala.
    R = zeros(m, n);
    % Ii dau cast pentru o acuratete mai mare a calculelor
    R = cast(R, "double");
    % TODO: Calculeaza matricea de transformare care este o matrice de rotatie
    T = [C -S; S C];
    % Ii dam cast la double pentru a fi siguri
    T = cast(T, "double");
    % TODO: Inverseaza matricea de transformare, FOLOSIND doar functii predefinite!
    % Inversa matricii de rotatie este chiar transpusa sa
    T_inv = T';
    % Din nou cast la double
    T_inv = cast(T_inv, "double");
    % Se parcurge fiecare pixel din imagine.
    for y = 0 : m - 1
        for x = 0 : n - 1
            % TODO: Aplica transformarea inversa asupra (x, y) si calculeaza x_p si y_p
            % din spatiul imaginii initiale.
            Z = T_inv * [x; y];
            x_p = Z(1);
            y_p = Z(2);
            % TODO: Trece (xp, yp) din sistemul de coordonate [0, n - 1] în
            % sistemul de coordonate [1, n] pentru a aplica interpolarea.
            x_p = x_p + 1;
            y_p = y_p + 1;
            % TODO: Daca xp sau yp se afla în exteriorul imaginii,
            % se pune un pixel negru si se trece mai departe.
            if (x_p > n || x_p <1 || y_p > m || y_p < 1)
              R(y+1, x+1) = 0;
              continue;
            endif
            % TODO: Afla punctele ce înconjoara(xp, yp).
            x1 = floor(x_p);
            x2 = x1 + 1;
            y1 = floor(y_p);
            y2 = y1 + 1;
            if x2 == n
              x1--;
              x2--;
            endif
            if y2== m
              y1--;
              y2--;
            endif
            % Ulimele 2 if uri pentru corner case uri
            % TODO: Calculeaza coeficientii de interpolare notati cu a
            % Obs: Se poate folosi o functie auxiliara în care sau se calculeze coeficientii,
            % conform formulei.
             a = zeros(4, 1);
             a = proximal_coef(I, x1, y1, x2, y2);
            % TODO: Calculeaza valoarea interpolata a pixelului (x, y).
            R(y+1, x+1) = a(1) + a(2) * (x_p) + a(3) * (y_p) + a(4) *(x_p)*(y_p);
        endfor
    endfor

    % TODO: Transforma matricea rezultata în uint8 pentru a fi o imagine valida.
    R = cast(R, "uint8");
endfunction
