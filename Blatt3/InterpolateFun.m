function p = InterpolateFun(a, b, n, f)
  % Erstelle Wertetabelle von n Punkten Intervall [a,b] von f
  function [x,y] = createTable(a, b, n, f)
    x = linspace(a,b,n);
    y = zeros(1,n);
    for i=1:n
      y(i)=f(x(i));
    endfor
  endfunction

  % Interpoliere
  function p = interpolate(a, b, x, y)
    [x,y] = createTable(a, b, n, f);
    P = Lagrange(x,y);
    p = @(x) 0;
    for i=1:n
      a_i = P(i);
      p_i = @(x) a_i.*x.^(i-1)+p(x);
      p = p_i;
    endfor
  endfunction
  [x,y] = createTable(a, b, n, f);
  p = interpolate(a, b, x, y);
endfunction