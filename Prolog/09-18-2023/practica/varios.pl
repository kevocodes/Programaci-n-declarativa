madre(blanca).
madre(carmen).

madre(blanca, aurora).
madre(blanca, amanda).
madre(blaca, elisa).

alguien(flori).
alguien(sasi).

% consulta: ?- listing(madre).
% resultado: madre(blanca).
%            madre(carmen).
%            madre(blanca, aurora).
%            madre(blanca, amanda).

% consulta: ?- listing(madre/2).
% resultado: madre(blanca, aurora).
%            madre(blanca, amanda).

