% ==== CASOS BASE ====

% Derivada de una constante
d(x, C, 0) :- number(C), !.

% Derivada una variable respecto a si misma
d(x, x, 1) :- !.

% Derivada de x a la N:
d(x, x^N, N*x^N1) :- number(N), is(N1, -(N,1)), !.

% Derivada de una constante por x
d(x, C*x, C):- number(C), !.

% Derivada de una constante por x a la N
d(x, C*x^N, Coef*x^N1) :- number(C), number(N), is(N1, -(N,1)), is(Coef, *(C, N)), !.

% Derivada del ln(X):
d(x, ln(x), 1/x):- !.

% Derivada de una constante elevada a la equis
d(x, C^x, C^x*log(C)) :- number(C), !.

% ==== CASOS RECURSIVOS ====

% Derivada de una suma de dos funciones
d(x, A+B, DxA+DxB) :- d(x, A, DxA), d(x, B, DxB), !.

% Derivada de una resta de dos funciones
d(x, A-B, DxA-DxB) :- d(x, A, DxA), d(x, B, DxB), !.

% Derivada de una constante por una función:
d(x, C*F, C*DF):-
  number(C),
  d(x, F, DF),
  !.

% Derivada del producto de dos funciones
d(x, F*G, DF*G + F*DG):-
  d(x, F, DF),
  d(x, G, DG),
  !.