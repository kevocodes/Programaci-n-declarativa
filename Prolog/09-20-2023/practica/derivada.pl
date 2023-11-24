% Derivada de una constante:
d(x, C, 0):- number(C), !.

% Derivada de x respecto a x:
d(x, x, 1):- !.

% Derivada de x a la N:
d(x, x^N, N*x^N1):- number(N), is(N1, -(N, 1)), !.

% Derivada de una constante por x:
d(x, C*x, C):- number(C), !.

% Derivada de una constante por x a la N:
d(x, C*x^N, Coef*x^N1):-
    number(C),
    number(N),
    is(N1, -(N, 1)),
    is(Coef, *(C, N)),
    !.

% Derivada de la suma de dos funciones:
d(x, A + B, DxA + DxB):-
    d(x, A, DxA),
    d(x, B, DxB),
    !.

% Derivada de la resta de dos funciones:
d(x, A - B, DxA - DxB):-
    d(x, A, DxA),
    d(x, B, DxB),
    !.

% Derivada de a elevada a la x:
d(x, C^x, C^x*log(C)):- number(C), !.

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
    d(X, A, DxA),
    d(X, B, DxB),
    !.

% Derivada de la resta de dos funciones:
de(X, A - B, DxA - DxB):-
    var(X),
    d(X, A, DxA),
    d(X, B, DxB),
    !.

% Derivada de a elevada a la x:
de(X, C^X, C^X*log(C)):- var(X), number(C), !.

