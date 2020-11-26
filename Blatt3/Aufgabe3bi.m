function Aufgabe3bi()
  f_2 = @(x) sqrt(abs(x));
 
  [P_f2,P_f2] = Aufgabe3a;
  len = size(P_f2);

  gridsize = 2;

  x = linspace(-1,1, gridsize);
  y = f_2(x);
  plot(x, y);
  hold on;
  title('Interpol. von 1/(1+x^2)','FontSize',14);
  pause 
  
  while true
    clf;
    x = linspace(-1,1, gridsize);
    y_1 = P_f2{1}(x)
    y_2 = P_f2{2}(x)
    y_3 = P_f2{3}(x)
    y = f_2(x);

    plot(x,y, x,y_1, x,y_2, x,y_3);
    
    pause
    gridsize*=2;
  endwhile
endfunction