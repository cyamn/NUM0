function Aufgabe4bc()
  % plotte f und Pn für n in N aud I = [a,b] mit kleiner werdenden Gittergröße
  % wartet auf tastetndruck bevor es nächste Gittergröße plottet
  function Plotter(a, b, N, f)
    gridsize = 2;
    f1 = figure;
    hold on;
    while true
      clf;
      % plotte f
      x = linspace(a,b, 9999);
      plot(x,f(x), "-r");
      hold on;
      % plotte all p (Interpolierende)
      x = linspace(a,b, gridsize);
      for n=1:length(N)
        p=InterpolateFun(a, b, N(n), f);
        plot(x, p(x));
        hold on;
      endfor
      pause
      % beende falls genau genug
      if gridsize > 250
        close(f1);
        break;
      endif
      gridsize*=2;
    endwhile
  endfunction

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
%       insgesamt kleiner wird, wird der Fehler an manchen Punkten x in [a,b]
%       wie gesagt extrem hoch werden kann.
%