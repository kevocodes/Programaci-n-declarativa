% Ejemplo de derivada evaluada en un punto
% de(X, 5*X^9, W), is(X, 5), is(Resp, W).

%----------------- Derivadas listas para la evaluación -----------

% Derivada de una constante:
de(X, C, 0):- var(X), number(C), !.

% Derivada de x respecto a x:
de(X, X, 1):- var(X), !.

% Derivada de x a la N:
de(X, X^N, N*X^N1):- var(X), number(N), is(N1, -(N, 1)), !.

% Derivada de una constante por x:
de(X, C*X, C):- var(X), number(C), !.

% Derivada de una constante por x a la N:
de(X, C*X^N, Coef*X^N1):-
    var(X),
    number(C),
    number(N),
    is(N1, -(N, 1)),
    is(Coef, *(C, N)),
    !.

% Derivada de la suma de dos funciones:
de(X, A + B, DxA + DxB):-
    var(X),
    de(X, A, DxA),
    de(X, B, DxB),
    !.

% Derivada de la resta de dos funciones:
de(X, A - B, DxA - DxB):-
    var(X),
    de(X, A, DxA),
    de(X, B, DxB),
    !.

% Derivada de a elevada a la x:
de(X, C^X, C^X*log(C)):- var(X), number(C), !.


% Funcion para calcular la derivada
calcular_derivada(X, F) :-
  de(X, F, D),
  assert((evfunc(X, R) :- is(R, F))),
  assert((evDfunc(X, R) :- is(R, D))).