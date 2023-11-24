% Factorial de un número:
%factorial/2: Número, Respuesta

factorial(0, 1):- !.

factorial(1, 1):- !.

factorial(N, Fact):-
    >(N, 1),
    is(Nm1, -(N, 1)), % Nm1 = N - 1
    factorial(Nm1, FactNm1), % FactAux = factorial(N-1)
    is(Fact, *(N, FactNm1)). % return N * factorial(N-1) -> Fact = N * FactAux


% consulta ?- factorial(3, Res). -> Res = 6

% factorial(N, Fact):- % N = 3, Fact = 6
%   >(N, 1),
%   is(Nm1, -(N, 1)), % N - 1 = 3 - 1 -> 2
%   factorial(Nm1, FactAux), % factorial(2, FactAux) -> Finalizada; FactAux = 2

%   is(Fact, *(N, FactAux)). % Fact = 3 * FactAux = 3 * 2 -> 6


% factorial(N, Fact):- % N = 2, Fact = ?
%   >(N, 1),
%   is(Nm1, -(N, 1)), % N - 1 = 2 - 1 -> 1
%   factorial(Nm1, FactAux), % factorial(1, FactAux) -> Finalizada; FactAux = 1

%   is(Fact, *(N, FactAux)). % Fact = 2 * FactAux = 2 * 1 -> 2


% factorial(1, 1):- !. % N = 1, Fact = 1
