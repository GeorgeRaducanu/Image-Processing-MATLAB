function [VV WW VV1 WW1] = nonsymetricLanczos(A, V, W, m)
  [d B] = qr(W.' * V);
  [n, n] = size(A);
  VV = zeros(n, n, m);
  WW = zeros(n, n, m);
  VV(:, :, 1) = V * inv(B);
  WW(:, :, 1) = W * d;
  #VV1 = zeros(n, n, m+2); # astea sunt V~ care pe forum s-a zis ca e VV
  #WW1 = zeros(n, n, m+2); # astea sunt W~ care pe forum s-a zis ca e WW
  VV(:, :, 2) = A * VV(:, :, 1);
  WW(:, :, 2) = A.' * WW(:, :, 1);
  alpha = zeros(n, n, m);
  beta = zeros(n, n, m);
  delta = zeros(n, n, m);
  s = zeros(n, n, m);
  v = zeros(n, n, m);
  d = zeros(n, n, m);
  for j = 1:m
    alpha(:, :, j) = WW(:, :, j).' * VV1(:, :, j + 1);
    VV(:, :, j + 1) = VV(:, :, j + 1) - VV(:, :, j) * alpha(:, :, j);
    WW(:, :, j + 1) = WW(:, :, j + 1) - WW(:, :, j)* (alpha(:, :, j)');
    [VV(:, :, j + 1), beta(:, :, j + 1)] = qr(VV(:, :, j + 1));
    [WW(:, :, j + 1), delta(:, :, j + 1)] = qr(WW(:, :, j + 1));
    delta(:, :, j + 1) = delta(:, :, j + 1).';
    [s(:, :, j+1), v(:, :, j+1), d(:, :, j+1)] = svd(WW(:, :, j+1)' * VV(:, :, j + 1));
    delta(:, :, j+1) = delta(:, :, j+1) * s(:, :, j+1) *( v(:, :, j+1) ^ 0.5);
    beta(:, :, j+1) = ( v(:, :, j+1) ^ 0.5) * d(:, :, j+1) * beta(:, :, j+1);
    VV(:, :, j+1) = VV(:, :, j+1) * (d(:, :, j+1).') * ( v(:, :, j+1) ^ (-0.5));
    WW(:, :, j+1) = WW(:, :, j+1) * (s(:, :, j+1).') * ( v(:, :, j+1) ^ (-0.5));
    VV(:, :, j + 2) = A * VV(:, :, j + 1) - VV(:, :, j) * delta(:, :, j+1);
    WW(:, :, j + 2) = A' * WW(:, :, j + 1) - WW(:, :, j) *( beta(:, :, j+1)');
  endfor
endfunction