p(a).
p(b).
q(b).
q(c).
r(X,Y):-
  p(X),q(X).

r(c, Y):-
  q(Y).

r(X,X):-
  p(X),q(X).