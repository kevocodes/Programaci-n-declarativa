% Calcuar el n-ésimo término de
% la serie de fibonacci:
%fibo/2 -> fibo(N, Fn) -> Fn es el n-ésimo término de la serie de fibonacci (respuesta), N es el número de término que se quiere calcular

fibo(1, 0):- !.

fibo(2, 1):- !.

fibo(N, Fn):-
    is(Nm1, -(N, 1)),
    fibo(Nm1, Fnm1),
    is(Nm2, -(N, 2)),
    fibo(Nm2, Fnm2),
    is(Fn, +(Fnm1, Fnm2)).

% ? - fibo(3, Res) -> Res = 1

% fibo(N, Fn):- % N = 3, Fn = 1
%   is(Nm1, -(N, 1)), % Nm1 = N - 1 = 3 - 1 = 2
%   fibo(Nm1, Fnm1), % fibo(2, Fnm1) -> terminado; Fnm1 = 1
%   is(Nm2, -(N, 2)), % Nm2 = N - 2 = 3 - 2 = 1
%   fibo(Nm2, Fnm2), % fibo(1, Fnm2) -> terminado; Fnm2 = 0
%   is(Fn, +(Fnm1, Fnm2)). % Fn = Fnm1 + Fnm2 = 1 + 0 = 1

% fibo(2, 1):- !. % N = 2, retorna Fn = 1 

% fibo(1, 0):- !. % N = 1, retorna Fn = 0