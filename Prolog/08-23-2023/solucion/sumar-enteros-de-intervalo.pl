% Suma de los enteros comprendidos en un intervalo:
% suma_intervalo(A, B, S) -> A = limite inferior, B = limite superior, S = suma de los enteros comprendidos en el intervalo [A, B]

% [1, 2, 3, 4]
% 1 + [2, 3 , 4] 
      % 2 + [3, 4]
      %     3 + [4]:li-> 4, ls -> 4 
      %         4: ls

suma_intervalo(A, B, B):-
  =:=(A, B),
  !.

suma_intervalo(A, B, S):-
  <(A, B),
  is(Asig, +(A, 1)),
  suma_intervalo(Asig, B, Saux),
  is(S, +(Saux, A)).

% ?- suma_intervalo(1, 3, Res). -> Res = 6

% suma_intervalo(A, B, S):- % A = 1, B = 3, S = 6
%   <(A, B),
%   is(Asig, +(A, 1)), % Asig = 2
%   suma_intervalo(Asig, B, Saux), % suma_intervalo(2, 3, Saux) -> terminado; Saux = 5
%   is(S, +(Saux, A)). % S = 5 + 1 = 6

%   suma_intervalo(A, B, S):- % A = 2, B = 3, S = 5
%   <(A, B),
%   is(Asig, +(A, 1)), % Asig = 3
%   suma_intervalo(Asig, B, Saux), % suma_intervalo(3, 3, Saux) -> terminado; Saux = 3
%   is(S, +(Saux, A)). % S = 3 + 2 = 5

%   suma_intervalo(A, B, B):- % A = 3, B = 3
%   =:=(A, B),
%   !.


% [1, 2, 3] 

% suma = 1; termActual = 1

% suma = 1 + 2; termActual = 2

% suma = 1 + 2 + 3; termActual = 3

% Parar cuando termActual = 3 o termActual = Limite superior del intervalo

% suma [1, 2, 3] =  1 + suma [2, 3] -> 1 + 5 = 6

% suma [2, 3] = 2 + suma [3] -> 2 + 3 = 5

% suma [3] = 3
