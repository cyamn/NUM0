function erg = aufgabe4a(X)
  function l = calculateL(X,Y,k,j)

    l = ;
  endfunction

  function V = distribute(I, seed, k, n)
    % assert I, seed sorted
    len = length(I);
    variation = length(seed);

    % binomial coefficient
    targetLen = nchoosek(n, n-k);
    V = zeros(1,targetLen);
    head = 1;
    i = 1;
    while head < n
      offset = variation-i;
      head += offset;
      faktor = seed(i);
      for j=1:head
        V(j) = faktor * I(offset+j);        
      endfor
      i++;
    endwhile
  endfunction
  
  function b_k = calculateB(X, k, n, y_k)
    in_b_k = 1;
    for j = 1:n
        if j ~= k
            in_b_k*=X(k)-X(j);
        endif
    endfor
    b_k = y_k/in_b_k;
  endfunction

  n = length(X);
  b = zeros(n,1);
  a = zeros(n,1);

  % calculate bk's
  for k = 1:n
      b(k) = calculateB(X, k, n, Y(k));
  endfor

  for k = 1:n
    summ = 0;
    % calculate sum
    for j = 1:n
      l_k = calculateL(X, k, j);
      summ += b(j) * l_k;
    endfor
    a(k) = -1.^(k+1) * summ;
  endfor

  erg = a;



endfunction