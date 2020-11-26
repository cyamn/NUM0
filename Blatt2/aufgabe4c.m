function erg = aufgabe4c(A, xi, X)
  function b_k = horner(X, A, k, n, xi)
    if k == n
      b_k = A(k);
    else
      % recursion
      b_k1 = horner(X, A, k+1, n, xi);
      b_k = A(k) + (xi - X(k))*(b_k1);
    endif
  endfunction

  n = length(A);
  % if no X create sentient
  if nargin < 3
    X = zeros(1, n);
  end
  erg = horner(X, A, 1, n, xi);
endfunction