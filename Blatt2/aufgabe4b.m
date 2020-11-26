function erg = aufgabe4b(X, Y)
  function erg = dividedDiffs(X, Y, i, j)
    if i == j
      erg = Y(i);
    else
      % recursion
      left = dividedDiffs(X, Y, i+1, j);
      right = dividedDiffs(X, Y, i, j-1);
      % assert X(j) ~= X(i)
      erg = (left - right) / (X(j)-X(i));
    endif
  endfunction

  n = length(X);
  C = zeros(n,1);
  for j = 1:n
    C(j) = dividedDiffs(X, Y, 1, j);
  endfor
  erg = C;
endfunction