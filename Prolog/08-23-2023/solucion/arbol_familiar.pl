sexo(jacinta, f).
sexo(josefina, f).
sexo(ligia, f).
sexo(marina, f).
sexo(silvia, f).
sexo(regina, f).
sexo(nemesia, f).

sexo(mario, m).
sexo(jaime, m).
sexo(carlos, m).
sexo(manuel, m).
sexo(julio, m).

% Relación madre/2:
madre(josefina, mario).
madre(josefina, ligia).
madre(silvia, marina).
madre(silvia, jaime).
madre(silvia, carlos).
madre(ligia, regina).
madre(ligia, jacinta).
madre(nemesia, tere).

% Relación padre/2:
padre(manuel, mario).
padre(manuel, ligia).
padre(mario, marina).
padre(mario, jaime).
padre(mario, carlos).
padre(julio, regina).
padre(julio, jacinta).
padre(carlos, tere).

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
    sexo(X, m),
    padre(P, X),
    padre(P, Y),
    madre(M, X),
    madre(M, Y),
    \==(X, Y).

hermana(X, Y):-
    sexo(X, f),
    padre(P, X),
    padre(P, Y),
    madre(M, X),
    madre(M, Y),
    \==(X, Y).

% ELABORAR LAS REGLAS: tios/2, primos/2.
% Expicar cómo Prolog ejecuta una regla.
% Backtracking y otros predicados. Dar ejemplos.

% Relación tio/2:
tio(X, Y):-
    padre(P, Y),
    hermano(X, P).

% Relación primo/2:
primo(X, Y):-
    (   padre(U, X) ; madre(U, X)),
    (   padre(V, Y) ; madre(V, Y)),
    hermano(U, V).


algo(este).
algo(aquel).

prueba(X):-
    !, algo(X).

% Verificar si una persona es antepasado de otra:
antepasado(X, Y):-
    padre(X, Y), !.

antepasado(X, Y):-
    madre(X, Y), !.

antepasado(X, Y):-
    padre(P, Y),
    antepasado(X, P).

antepasado(X, Y):-
    madre(M, Y),
    antepasado(X, M).

% Mostrar líneas de antepasados de una persona:
linea_antepasados(X):-
    \+ padre(_, X),
    writeln('---'),
    !.

linea_antepasados(X):-
    \+ madre(_, X),
    writeln('---'),
    !.

linea_antepasados(X):-
    padre(P,  X),
    linea_antepasados(P),
    writeln(P).

linea_antepasados(X):-
    madre(M,  X),
    linea_antepasados(M),
    writeln(M).

% Mostrar líneas de descendientes de una persona:

linea_descendientes(X):-
    padre(X, H),
    linea_descendientes(H),
    writeln(H).

linea_descendientes(X):-
    madre(X, H),
    linea_descendientes(H),
    writeln(H).

linea_descendientes(X):-
  \+ padre(X, _),
  writeln('---'),
  !.

linea_descendientes(X):-
  \+ madre(X, _),
  writeln('---'),
  !.

