% Funktion zu bestimmung der Koeffizienten des Interpolationspolynoms
% mithilfe der Lagrange-Basispolynome.
%
% Input: Vektoren x und y gleicher länge, in der die Stützstellen (x)
%	und die Funktionswerde der zu interpolierenden Funktion
%	an jeweils identische stellen geschrieben sind.
%
% Output: Vektor P mit den Koeffizienten des interpolationspolynoms
%	bezüglich der Monombasis. Der erste Eintrag ist der 0-te
%	Koeffizient, also P = [a_0, a_1, ...., a_n] mit dem Polynom
%	als f(x) = a_0 + a_1 * x + a_2 * x**2 + ... + a_n * x**n
%

function [P] = Lagrage (x,y)
	if size(x)(1) != 1 
		x = x';
	end
	if size(y)(1) != 1
		y = y';
	end
	n = length(x);
	for i = 1:n
		q = 1;
		l = 1;
		for j = 1:n
			if j != i
				q = q * (x(i)-x(j));
				l = conv([-x(j), 1], l);
			end
		end
		L(:,i) = l./q;
	end
	P = (L * y')';
end