% Conteo creciente:
contando(X):-
  contar(1, X).

contar(A, B):-
  =:=(A, B),
  writeln(A),
  !.

contar(A, B):-
  <(A, B),
  writeln(A),
  is(Aaux, +(A, 1)),
  contar(Aaux, B).