% *-------- Truco prolog ----------*
% ?- gtrace. -> activa el modo debug
% ?- notrace. -> desactiva el modo debug
% ?- nodebug. -> desactiva el modo debug
% *--------------------------------*
% ----------------------------------------
%           LISTAS EN PROLOG
% ----------------------------------------

% Asignacion de una lista a una variable
%?- =(L, [hola, que, tal]).

% Secuencia de elementos diferentes
%?- =(L, [hola, perro(fido), 5]).

% Lista de listas
%?- =(L, [[hola, perro(fido), 5], [uno, dos, tres], [1, 2, 3]]). 

% Lista vacia -> []
%?- =(L, []). 

% ---- Operaciones con listas ----
% Para agregar o eliminar se debe hacer desde el principio de la lista
% las listas tienen la forma [cabeza | cola]
% por lo que para agregar un elemento se debe hacer [elemento | lista]
% para eliminar un elemento se debe hacer [elemento | lista]

% Agregar un elemento a una lista
%?- =(L, [hola, que, tal]), =(L2, [buenos, dias | L]).
%?- =(L1, [1, 2, 3]), is(A, 4), =(L2, [A | L1]).

% Ejercicio:
% 1- Escribe una regla que recibe una lista y despliega todos sus elementos

mostrar_elementos([]) :- !.

mostrar_elementos(L) :-
  =(L, [Cabeza | Cola]),
  writeln(Cabeza),
  mostrar_elementos(Cola).

% 2- Escribe una regla que recibe una lista y despliega todos sus elementos en orden inverso

mostrar_elementos_inverso([]) :- !.

mostrar_elementos_inverso(L) :-
  =(L, [Cabeza | Cola]),
  mostrar_elementos_inverso(Cola),
  writeln(Cabeza).

% 3- Llenar una lista con los numeros del 1 al N 
% Nota -> compone la lista cuando va a una llamada recursiva

% consulta: ?- llenar_1_N(4, [], Respuesta).

llenar_1_N(0, L, L) :- !. % N = 0, L = [1, 2, 3, 4], Lf = [1, 2, 3, 4]

llenar_1_N(N, L, Lf) :- % N = 1, L = [2, 3, 4]
  =(Lsig, [N | L]), % Lsig = [1 | [2, 3, 4]] -> [1, 2, 3, 4]
  is(Nant, -(N, 1)), % Nant = 0
  llenar_1_N(Nant, Lsig, Lf). % 0, [1, 2, 3, 4], Lf

% 4- Llenar una lista con los numeros del N al 1 
% Nota -> compone la lista cuando regresa de la llamada recursiva


llenar_N_1(0, []) :- !.

llenar_N_1(N, [N | Laux]) :-
  is(Nant, -(N, 1)),
  llenar_N_1(Nant, Laux). 

% Consulta: ?- llenar_N_1(3, Respuesta). -> Respuesta = [3, 2, 1]

% % 1er llamada
% llenar_N_1(N, [N | Laux]) :- % N = 3, Laux = [3 | [2,1]] : [3, 2, 1]
%   is(Nant, -(N, 1)), % Nant = 2
%   llenar_N_1(Nant, Laux). % 2, Laux = [2, 1]

% % 2da llamada
% llenar_N_1(N, [N | Laux]) :- % N = 2, Laux = [2 | [1]] : [2, 1]
%   is(Nant, -(N, 1)), % Nant = 1
%   llenar_N_1(Nant, Laux). % 1, Laux = [1]

% % 3era llamada
% llenar_N_1(N, [N | Laux]) :- % N = 1, Laux = [1 | []] : [1]
%   is(Nant, -(N, 1)), % Nant = 0
%   llenar_N_1(Nant, Laux). % 0, Laux = []

% % 4ta llamada
% llenar_N_1(0, []) :- !. % N = 0, Laux = []
