factorial(X) :-
  is(Prev, -(X,1)),
  factorial(X,Prev).

factorial(X, Prev) :-
  =:=(X, 0),
  writeln(1),
  !.

factorial(X, Prev) :-
  =:=(Prev, 0),
  writeln(X),
  !.
  
factorial(X, Prev) :-
  >(Prev, 0),
  is(Prod, *(X, Prev)),
  is(Newprev, -(Prev, 1)),
  factorial(Prod, Newprev).