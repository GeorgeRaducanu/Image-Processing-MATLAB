function out = proximal_2x2_RGB(img, STEP)
    % ==============================================================================================
    % Aplica Interpolare Proximala pe imaginea 2 x 2 definita img cu puncte intermediare echidistante.
    % img este o imagine colorata RGB -Red, Green, Blue.
    % =============================================================================================
    % Se aplica functia de alb-negru pe fiecare componenta a imaginii
    % Restul comentariilor sunt cele din schelet, fiind suficient de relevante
    % TODO: Extrage canalul rosu al imaginii.
    img_red = img(:, :, 1);
    % TODO: Extrage canalul verde al imaginii.
    img_green = img(:, :, 2);
    % TODO: Extrage canalul albastru al imaginii.
    img_blue = img(:, :, 3);
    % TODO: Aplic? functia proximal pe cele 3 canale ale imaginii.
    out_red = proximal_2x2(img_red, STEP);
    out_green = proximal_2x2(img_green, STEP);
    out_blue = proximal_2x2(img_blue, STEP);
    % TODO: Formeaza imaginea finala concatenând cele 3 canale de culori.
    [n, n] = size(out_red);
    out = zeros(n, n, 3);
    out(:, :, 1) = out_red;
    out(:, :, 2) = out_green;
    out(:, :, 3) = out_blue;
endfunction
