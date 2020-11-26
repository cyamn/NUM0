% Funktion zur bestimmung der Newton-basispolynome bezüglich
% der Monombasis.
% 
% Input: Vektor mit Stützstellen (x)
%	eventuell schon berechnete Newtonbasis is identischer Form
%	wie in Output (N), kann zur initialen Berechnung weg gelassen
%	werden, der Default wert ist grade N_0.
%
% Output: quadratische Matrix, in deren Spalten die Koeffizienten der
%	Newton-basispolynome bezüglich der Monombasis stehen. In der
%	ersten zeile jeweils 0-te koeffizient, in der n-ten zeile
%	der (n-1)-te, also
%
%	       /(N_0)_0	(N_1)_0	...	(N_n)_0	\
%	       |0	(N_1)_1	...	(N_n)_1	|
%	N =    |:	0	...	(N_n)_2	|
%	       |0	:	...	:	|
%	       \0	0	...	(N_n)_n	/
%
% Verwendung in Kombination mit Newton.m:
%	x = [x_0, x_1, ...., x_n]
%	y = [y_0, y_1, ...., y_n]
%	P_N = Newton(x,y)
%	N = Newton_basis(x)
%	P = P_N * N'
% Dann ist P wie in Lagrange.m (die Koeffizienten des Polynoms
% bezüglich der Monombasis als Zeilenvektor mit 
% P = [a_0, a_1, ..., a_n] und dem Polynom als
% f(x) = a_0 + a_1 * x + a_2 * x**2 + ... + a_n * x**n
%

function [N] = Newton_basis(x, N = eye(length(x))(:,1))
	n = length(x);
	m = size(N)(2);
	N(m+1:n, 1:m) = 0;
	for i = m:(n-1)
		N(:,i+1) = conv(N(:,i), [-x(i), 1])(1:n);
	end	
end
