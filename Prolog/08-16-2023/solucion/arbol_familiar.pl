% Relacion madre/2:
madre(josefina, mario).
madre(josefina, ligia).
madre(silvia, marina).
madre(silvia, jaime).
madre(silvia, carlos). 
madre(ligia, regina). 
madre(ligia, jacinta).

% Relacion padre/2:
padre(manuel, mario).
padre(manuel, ligia).
padre(mario, marina).
padre(mario, jaime). 
padre(mario, carlos).
padre(julio, regina).
padre(julio, jacinta).

% Abuelos: 

% Abuelo:
abuelo(X, Y):-
  padre(X, Z),
  padre(Z, Y).

abuelo(X, Y):-
  padre(X, Z),
  madre(Z, Y).

% Abuela:
abuela(X, Y):-
  madre(X, Z),
  padre(Z, Y).

abuela(X, Y):-
  madre(X, Z),
  madre(Z, Y).

%abuelos(X, Y):-
  %abuelo(X, Y) ; abuela(X, Y).

abuelos(X, Y):-
  abuelo(X, Y).

abuelos(X, Y):-
  abuela(X, Y).

% hermanos:
hermano(X, Y):-
  padre(P, X),
  padre(P, Y), 
  madre(M, X),
  madre(M, Y). 

% Relación tio/2:
tio(X, Y):-
  padre(P, Y),
  hermano(X, P).

tio(X, Y):-
  madre(M, Y),
  hermano(X, M).

% Relación primo/2:
primo(X, Y):-
  (padre(U, X) ; madre(U, X)),
  (padre(V, Y) ; madre(V, Y)),
  hermano(U, V).

% corte
saludar(X) :-
  atom(X),
  write('Hola y no molestes'),
  !.

saludar(X):-
  write('Hola '),
  write(X).