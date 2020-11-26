function V = distribute(I, seed, k, n)
  % assert I, seed sorted
  len = length(I)
  variation = length(seed);

  % binomial coefficient
  targetLen = nchoosek(n, n-k)
  V = zeros(1,targetLen);
  head = 1;
  i = 1;
  while 1
    offset = variation-i;
    head += offset;
    faktor = seed(i);

    if ~(head < len)
      break;
    end

    for j=1:head
      V(j) = faktor * I(offset+j-1);        
    endfor
    i++;
  endwhile
endfunction