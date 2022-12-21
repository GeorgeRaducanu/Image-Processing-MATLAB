function out = proximal_resize_RGB(img, p, q)
    % =========================================================================
    % Redimensioneaza imaginea img astfel încât aceasta save fie de dimensiune p x q.
    % Imaginea img este colorata. Se aplica functia de la alb-negru pe fiecare canal de culoare
    % =========================================================================
    % Dimensiunile imaginii
    [n, m, ~] = size(img);
    % Comentariile in continuare sunt cele din schelet fiind suficient de relevante
    % TODO: Extrage canalul rosu al imaginii.
    img_red = img(:, :, 1);
    % TODO: Extrage canalul verde al imaginii.
    img_green = img(:, :, 2);
    % TODO: Extrage canalul albastru al imaginii.
    img_blue = img(:, :, 3);
    % TODO: Aplica functia proximal pe cele 3 canale ale imaginii.
    out_red = proximal_resize(img_red, p, q);
    out_green = proximal_resize(img_green, p, q);
    out_blue = proximal_resize(img_blue, p, q);
    % TODO: Formeaza imaginea finala concatenând cele 3 canale de culori.
    out = zeros(p, q, 3);
    out(:, :, 1) = out_red;
    out(:, :, 2) = out_green;
    out(:, :, 3) = out_blue;
endfunction
