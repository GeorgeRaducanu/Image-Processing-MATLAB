function R = bicubic_resize(I, p, q)
    % =========================================================================
    % Folosind algoritmul de interpolare bicubica se scaleaza imaginea originala
    % Imaginea mxn devine pxq
    % =========================================================================

    %Aflam dimensiunea si tipul imaginii
    [m n nr_colors] = size(I);

    % TODO: Initializeaza matricea finala drept o matrice nula.
    R = zeros(p, q);
    % Convertim I si R la double pentru o mai mare precizie
    I = cast(I, "double");
    R = cast(R, "double");
    % daca imaginea nu e alb negru, ignora
    if nr_colors > 1
        R = -1;
        return
    endif

    % Obs: Comentarii din schelet. Am considerat ca sunt relevante si sa le las
    % Atunci cand se aplica o scalare, punctul (0, 0) al imaginii nu se va deplasa.
    % In Octave, pixelii imaginilor sunt indexati de la 1 la n.
    % Daca se lucreaza in indici de la 1 la n si se inmulteste x si y cu s_x
    % respectiv s_y, atunci originea imaginii se va deplasa de la (1, 1) la (sx, sy)!
    % De aceea, trebuie lucrat cu indici in intervalul [0, n - 1]!
    % TODO: Calculeaza factorii de scalare
    % Obs: Daca se lucreaza cu indici in intervalul [0, n - 1], ultimul pixel
    % al imaginii se va deplasa de la (m - 1, n - 1) la (p, q).
    % s_x nu va fi q ./ n
    s_x = (q - 1)/(n - 1);
    s_y = (p - 1)/(m - 1);
    %am calculat factorii de scalare
    % TODO: Defineste matricea de transformare pentru redimensionare.
    %este o matrice diagonala avand pe diagonala factorii de scalare
    T = [s_x 0; 0 s_y];
    % TODO: Calculeaza inversa transformarii.
    % Am calculat tinand cont de modul cum se poate inversa o matrice diagonala
    T_inv = [1/s_x 0; 0 1/s_y];
    T_inv = cast(T_inv, "double");
    % TODO: Precalculeaza derivatele utilizand functia implementata anterior.
    [Ix Iy Ixy] = precalc_d(I);
    % Parcurge fiecare pixel din imagine cu 2 for uri.
    % Comentarile din for uri sunt cele din schelet, am considerat ca sunt suficient de clare si relevante
    for y = 0 : p - 1
        for x = 0 : q - 1
            % TODO: Aplica transformarea inversa asupra (x, y) si calculeaza x_p si y_p
            % din spatiul imaginii initiale.
            Z = T_inv * [x; y];
            x_p = Z(1);
            y_p = Z(2);
            % TODO: Trece (xp, yp) din sistemul de coordonate 0, n - 1 in
            % sistemul de coordonate 1, n pentru a aplica interpolarea.
            x_p = x_p + 1;
            y_p = y_p + 1;
            % TODO: Gaseste cele 4 puncte ce inconjoara punctul x, y
            x1 = floor(x_p);
            x2 = ceil(x_p);
            y1 = floor(y_p);
            y2 = ceil(y_p);
            % TODO: Calculeaza coeficientii de interpolare A.
            M = bicubic_coef(I, Ix, Iy, Ixy, x1, y1, x2, y2);
            % TODO: Trece coordonatele (xp, yp) in patratul unitate, scazand (x1, y1).
            x_p = x_p - x1;
            y_p = y_p - y1;
            % TODO: Calculeaza valoarea interpolata a pixelului (x, y).
            % Obs: Pentru scrierea in imagine, x si y sunt in coordonate de
            % la 0 la n - 1 si trebuie aduse in coordonate de la 1 la n.
            R(y + 1, x + 1) = [1 x_p x_p^2 x_p^3] * M * [1; y_p;  y_p^2; y_p^3];
            %calculul efectiv conform formulei al pixelului
        endfor
    endfor

    % TODO: Transforma matricea rezultata în uint8 pentru a fi o imagine valida.
    % Daca nu facem acest lucru nu va trece testele
    R = cast(R, "uint8");
endfunction





