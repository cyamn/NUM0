function [P_f1,P_f2] = Aufgabe3a ()
  function [x,y] = createTable(a, b, n, f)
    x = linspace(a,b,n);
    y = zeros(1,n);
    for i=1:n
      y(i)=f(x(i));
    endfor
  endfunction

  function p = interpolate(a, b, n, f)
    [x,y] = createTable(a, b, n, f);
    P = Lagrange(x,y);
    p = @(x) 0;
    for i=1:n
      a_i = P(i);
      p_i = @(x) a_i.*x.^(i-1)+p(x);
      p = p_i;
    endfor
  endfunction

  N=[5 10 20];
  f_1 = @(x) 1/(1+x.^2);
  f_2 = @(x) sqrt(abs(x));
  P_f1 = cell(3);
  P_f2 = cell(3);
  for n = 1 : length(N)
    P_f1(n) = interpolate(-1, 1, N(n), f_1);
    P_f2(n) = interpolate(-1, 1, N(n), f_2);
  endfor
endfunction