% relaciones madre:
madre(josefina, mario).
madre(josefina, ligia).
madre(silvia, marina).
madre(silvia, jaime).
madre(silvia, carlos).
madre(ligia, regina).
madre(ligia, jacinta).

% relaciones padre:
padre(manuel, mario).
padre(manuel, ligia).
padre(mario, marina).
padre(mario, jaime).
padre(mario, carlos).
padre(julio, regina).
padre(julio, jacinta).

% Reglas abuelo:
abuelo(X, Y) :-
  padre(X, W),
  padre(W, Y). % abuelo paterno

abuelo(X, Y) :-
  padre(X, W),
  madre(W, Y). % abuelo materno

% Reglas abuela:
abuela(X, Y) :-
  madre(X, W),
  madre(W, Y). % abuela materna

abuela(X, Y) :-
  madre(X, W),
  padre(W, Y). % abuela paterna

% Reglas abuelos:
abuelos(X, Y) :-
  abuelo(X, Y).

abuelos(X, Y) :-
  abuela(X, Y).

% abuelos(X, Y) :-
%   abuela(X, Y);
%   abuelos(X, Y). 

% Reglas hermano:
hermano(X, Y) :- 
  padre(Z, X),
  padre(Z, Y),
  madre(W, X),
  madre(W, Y).

% Reglas primos:
primos(X, Y) :-
  padre(Z, X),
  padre(W, Y),
  hermano(Z, W).
  

