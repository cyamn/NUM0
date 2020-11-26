% plotte f und Pn für n in N aud I = [a,b] mit kleiner werdenden Gittergröße
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