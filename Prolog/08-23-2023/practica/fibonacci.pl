% calcular el n-esimo termino de fibonnaci

fibo(1, 0) :- !.

fibo(2, 1) :- !.

fibo(N, Fn) :-
  is(Nm1, -(N, 1)),
  is(Nm2, -(N, 2)),
  fibo(Nm1, Fnm1),  
  fibo(Nm2, Fnm2),
  is(Fn, +(Fnm1, Fnm2)).