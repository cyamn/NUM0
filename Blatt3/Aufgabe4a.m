% P_f1 Array mit den Interpolierenden als function handle. Genauso P_f2
% 
% In diesem Bsp. ist z.B. P_f1{1}(3) das Interpolationspolinom zu 5 Stützstellen
% von der Funktion f_1 ausgewertet an x=3
function [P_f1, P_f2] = Aufgabe4a()
  N=[5 10 20];
  f_1 = @(x) 1/(1+x.^2);
  f_2 = @(x) sqrt(abs(x));
  P_f1 = cell(3);
  P_f2 = cell(3);
  for n=1 : length(N)
    P_f1(n) = InterpolateFun(-1, 1, N(n), f_1);
    P_f2(n) = InterpolateFun(-1, 1, N(n), f_2);
  endfor
endfunction