function [V_m_1 W_m_1] = rationalLanczos(A, B, C, sigma)
  [n, p] = size(B);
  S = zeros(n, p, m+1);
  R = zeros(n, p, m+1);
  V = zeros(n, p, m+1);
  W = zeros(n, p, m+1);
  H = zeros(n, p, m+1, m+1);
  G = zeros(n, p, m+1, m+1);
  P = zeros(n, p, m+1);
  Q = zeros(n, p, m+1);
  D = zeros(n, p, m+1);
  V_m_1 = zeros(n, (m+1)*p, m+1);
  W_m_1 = zeros(n, (m+1)*p, m+1);
  S(:,:, 1) = inv(A - sigma(1)*eye(n))*B;
  R(:,:, 1) = inv(A - sigma(1)*eye(n))' * (C');
  [V(:, :, 1) H(:, :, 1, 1)] = qr(S(:, :, 1));
  #alegem W1 ai W1'*V1 = eye(p);
  W(:, :, 1) = V(:, :, 1);
  G(:, :, 1, 1) = W(:, :, 1).' * R(:, :, 1);
  V_m_1(:, :, 1) = V(:, :, 1);
  W_m_1(:, :, 1) = W(:, :, 1);
  for k = 1:m
    if k < m
      if sigma(k+1) == inf
        S(:, :, k+1) = A * V(:, :, k);
        R(:, :, k+1) = A.' * W(:, :, k);
      else
        S(:, :, k+1) = inv(A - sigma(k+1)*eye(n)) * V(:, :, k);
        R(:, :, k+1) = inv(A - sigma(k+1)*eye(n)).' * W(:, :, k);
      endif
      H(:, :, k+1, k+1) = W_m_1(:, :, k).' * S(:, :, k+1);
      G(:, :, k+1, k+1) = V_m_1(:, :, k).' * R(:, :, k+1);
      S(:, :, k+1) -= V_m_1(:, :, k) * H(:, :, k+1, k+1);
      R(:, :, k+1) -= W_m_1(:, :, k) * G(:, :, k+1, k+1);
      [V(:, :, k+1), H(:, :, k+1, k+1)] = qr(S(:, :, k+1));
      [W(:, :, k+1), G(:, :, k+1, k+1)] = qr(R(:, :, k+1));
      [P(:, :, k), D(:, :, k), Q(:, :, k)] = svd(W(:, :, k+1)' * V(:, :, k+1));
      V(:, :, k+1) = V(:, :, k+1) * Q(:, :, k) * (D(:, :, k)^(-0.5));
      W(:, :, k+1) = W(:, :, k+1) * P(:, :, k) * (D(:, :, k)^(-0.5));
      H(:, :, k+1, k+1) = D(:, :, k) ^ 0.5 * Q(:, :, k).' * H(:, :, k+1, k+1);
      G(:, :, k+1, k+1) = D(:, :, k) ^ 0.5 * P(:, :, k).' * G(:, :, k+1, k+1);
      V_m_1(:, :, k+1) = [V_m_1(:, :, k), V(:, :, k+1)];
      W_m_1(:, :, k+1) = [W_m_1(:, :, k), W(:, :, k+1)];
    else
      if sigma(m+1) == inf
        S(:, :, m+1) = A*B;
        R(:, :, m+1) = A.'*C;
      else
        S(:, :, m+1) = inv(A)*B;
        R(:, :, m+1) = inv(A).'*C;
      endif
      H(:, :, m+1, m+1) = W_m_1(:, :, m).' * S(:, :, m+1);
      G(:, :, m+1, m+1) = V_m_1(:, :, m).' * R(:, :, m+1);
      [V(:, :, m+1), H(m+1, m+1)] = qr(S(:, :, m+1));
      [W(:, :, m+1), G(m+1, m+1)] = qr(R(:, :, m+1));
      [P(:, :, m), D(:, :, m), Q(:, :, m)] = svd(W(:, :, m+1).' * V(:, :, m+1));
      V(:, :, m+1) = V(:, :, m+1) * Q(:, :, m) * D(:, :, m) ^ (-0.5);
      W(:, :, m+1) = W(:, :, m+1) * P(:, :, m) * D(:, :, m) ^ (-0.5);
      H(:, :,m+1, m+1) = D(:, :, m)^0.5 * Q(:, :, m).' * H(:, :,m+1, m+1);
      G(:, :,m+1, m+1) = D(:, :, m)^0.5 * P(:, :, m).' * G(:, :,m+1, m+1);
      V_m_1(:, :, m+1) = [V_m_1(:, :, m), V(:, :, m+1)];
      W_m_1(:, :, m+1) = [W_m_1(:, :, m), W(:, :, m+1)];
    endif
  endfor
  endfunction