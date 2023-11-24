% suma de los enteros comprendidos en un intervalo
suma_intervalo(A, B, _) :-
  >(A, B),
  writeln('Error: el primer argumento debe ser menor que el segundo'),
  !,
  fail.
fail.

suma_intervalo(B, B, B) :-
  !. 

suma_intervalo(A,B,Suma) :-
  <(A,B),
  is(Asig,+(A,1)),
  suma_intervalo(Asig,B, SumaTemp),
  is(Suma, +(A,SumaTemp)).