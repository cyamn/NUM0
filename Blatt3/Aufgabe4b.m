function Aufgabe3b()
  N = [5 10 20];
  f_1 = @(x) 1./(1+x.^2);
  f_2 = @(x) sqrt(abs(x)); 
  Plotter(-1,1,N,f_1);
  Plotter(-1,1,N,f_2);
endfunction

%
% zu c) Funktion f_1 ist gut Lagrange interpolierbar aber f_2 fängt an
%       den Intervallgrenzen sehr stark an zu schwanken dies würde die
%       hohe Abschätzung von Korollar 3.13 erklären, da obwohl der Fehler
%       insgesamt kleiner wird der Fehler an manchen Punkten x in [a,b]
%       wie gesagt extrem hoch werden kann.
%