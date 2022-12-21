function [Am, Bm, Cm] = adaptiveLanczos(A, B, C, sigma, tol)
  [n, p] = size(B);
  H = zeros(p, p, n);
  H(:, :, 1) = eye(p);
  eps = 1;
  m = 1;
  while eps > tol
    [V_m_1 W_m_1] = rationalLanczos(A, B, C, sigma)
    Am = W_m_1*A*V_m_1;
    Bm = W_m_1.' * B;
    Cm = C * V_m_1;
    H(:, :, m) = Cm * inv(sigma(m)*eye(n) - Am)*Bm;
    eps = norm(H(:, :, m) - H(:, :, m-1), inf);
    m++;
  endwhile
endfunction