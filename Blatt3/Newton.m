% Funktion zu bestimmung der dividierten Differenzen aus dem Skript
% (Satz 3.10) zur bestimmung der Koeffizienten des Interpolations-
% polynoms bezüglich der Newton-Basispolynome.
%
% Input: Vektoren x und y gleicher länge, in der die Stützstellen (=x)
%	und die Funktionswerde der zu interpolierenden Funktion (=y)
%	an jeweils identische stellen geschrieben sind.
%
% Output: Vektor P mit den Koeffizienten des interpolationspolynoms
%	bezüglich der Newton-Basispolynome. Der erste Eintrag ist
%	der 0-te Koeffizient, also P = [a_0, a_1, ...., a_n] mit
%	dem Polynom als 
%	f(x) = a_0 + a_1 * N_1 + a_2 * N_2 + ... + a_n * N_n
%

function [P] = Newton (x,y)
	if size(x)(2) != 1 
		x = x';
	end
	if size(y)(2) != 1
		y = y';
	end
	n = length(x)-1; % Indexshift, damit n mit dem n 
				%aus der Def übereinstimmt
	Y(:,1) = y;
	for i=2:(n+1)
		for j=1:(n+2-i)
			Y(j,i) = Y(j+1,i-1) - Y(j,i-1);
			Y(j,i) = Y(j,i) / (x(i+j-1) - x(j));
		end
	end
	P = Y(1,:);
end

