% 1) Retornar la posicion de un elemento determinado en una lista. Si no se encuentra retornar  -1.

buscar_elemento(_, [], _, -1) :- !.

buscar_elemento(Elemento, [Elemento | _], Contador, Contador) :- !.

buscar_elemento(Elemento, [Cabeza | Cola], Contador, Posicion) :-
  \==(Elemento, Cabeza),
  is(Contadorm1, +(Contador, 1)),
  buscar_elemento(Elemento, Cola, Contadorm1, Posicion).

% consulta: ?- buscar_elemento(3, [1, 2, 3, 4, 5], 0, Posicion). -> Posicion = 2

% === CASO ELEMENTO ENCONTRADO ===
% % Elemento = 3, [1, 2, 3, 4, 5], Contador = 0, Posicion = 2
% buscar_elemento(Elemento, [Cabeza | Cola], Contador, Posicion) :- 
%   \==(Elemento, Cabeza), % Elemento: 3 !== Cabeza: 1 
%   is(Contadorm1, +(Contador, 1)), % Contadorm1: 1 = Contador: 0 + 1
%   buscar_elemento(Elemento, Cola, Contadorm1, Posicion). % 3, [2, 3, 4, 5], 1, Posicion = 2

% % Elemento = 3, [2, 3, 4, 5], Contador = 1, Posicion = 2
% buscar_elemento(Elemento, [Cabeza | Cola], Contador, Posicion) :- 
%   \==(Elemento, Cabeza), % Elemento: 3 !== Cabeza: 2 
%   is(Contadorm1, +(Contador, 1)), % Contadorm1: 2 = Contador: 1 + 1
%   buscar_elemento(Elemento, Cola, Contadorm1, Posicion). % 3, [3, 4, 5], 2, Posicion = 2

% % Elemento = 3, [3, 4, 5], Contador = 2, Posicion = Contador = 2
% buscar_elemento(Elemento, [Elemento | _], Contador, Contador) :- !.

% consulta: ?- buscar_elemento(3, [1, 2], 0, Posicion). -> Posicion = -1
% ==== CASO ELEMENTO NO ENCONTRADO ====

% Elemento = 3, [1, 2], Contador = 0, Posicion = -1
buscar_elemento(Elemento, [Cabeza | Cola], Contador, Posicion) :- 
  \==(Elemento, Cabeza), % Elemento: 3 !== Cabeza: 1 
  is(Contadorm1, +(Contador, 1)), % Contadorm1: 1 = Contador: 0 + 1
  buscar_elemento(Elemento, Cola, Contadorm1, Posicion). % 3, [2], 1, Posicion = -1

% Elemento = 3, [2], Contador = 1, Posicion = -1
buscar_elemento(Elemento, [Cabeza | Cola], Contador, Posicion) :- 
  \==(Elemento, Cabeza), % Elemento: 3 !== Cabeza: 2
  is(Contadorm1, +(Contador, 1)), % Contadorm1: 2 = Contador: 1 + 1
  buscar_elemento(Elemento, Cola, Contadorm1, Posicion). % 3, [], 2, Posicion = -1

% Elemento = 3, [], Contador = 2, Posicion = -1
buscar_elemento(_, [], _, -1) :- !.


% 2) Realizar la suma de todos los valores de una lista de numeros.

sumar_lista([], 0) :- !.

sumar_lista([Cabeza | Cola], Suma) :-
  sumar_lista(Cola, SumaCola),
  is(Suma, +(Cabeza, SumaCola)).

% 3) Realizar la suma de todos los elementos de una lista de numeros que son menores o iguales que un valor determinado.

sumar_menores(_, [], 0) :- !.

sumar_menores(Elemento, [Cabeza | Cola], Respuesta) :-
  sumar_menores(Elemento, Cola, RespuestaCola),
  (
    =<(Cabeza, Elemento), is(Respuesta, +(Cabeza, RespuestaCola)), !;
    >(Cabeza, Elemento), is(Respuesta, RespuestaCola)
  ).

% Menor o igual que 4
% [1,2,3,4,5] -> 1 <= 4 ? 1 + 9 : 9 -> 10
% [2,3,4,5] -> 2 <= 4 ? 2 + 7 : 7 -> 9
% [3,4,5] -> 3 <= 4 ? 3 + 4: 4 -> 7
% [4,5] -> 4 <= 4 ? 4 + 0 : 0 -> 4
% [5] -> 5<=4 ? 5 + 0 : 0 -> 0
% [] -> 0

  % 4) Crear una lista con datos introducidos desde el teclado. Terminar con la tecla t.

crear_lista(Lista) :-
  write("Ingrese un elemento (t para terminar): "),
  read(Elemento),
  (
    ==(Elemento, t), =(Lista, []), !;
    crear_lista(ListaCola), =(Lista, [Elemento | ListaCola])
  ).


% consulta: ?- crear_lista(Lista). -> Lista = [A, 2]

% presionas A
% crear_lista(Lista) :-
%   write("Ingrese un elemento (t para terminar): "),
%   read(Elemento), % A
%   (
%     ==(Elemento, t), =(Lista, []), !; % A == t -> false
%     crear_lista(ListaCola), =(Lista, [Elemento | ListaCola]) % crear_lista(ListaCola) -> [Elemento = A | [2]] 
%   ).

% crear_lista(Lista) :-
%   write("Ingrese un elemento (t para terminar): "),
%   read(Elemento), % 2
%   (
%     ==(Elemento, t), =(Lista, []), !; % 2 == t -> false
%     crear_lista(ListaCola), =(Lista, [Elemento | ListaCola]) % crear_lista(ListaCola = []) -> [Elemento = 2 | []] 
%   ).

% crear_lista(Lista) :-
%   write("Ingrese un elemento (t para terminar): "),
%   read(Elemento), % t
%   (
%     ==(Elemento, t), =(Lista, []), !; % t == t = true => Lista = []
%     crear_lista(ListaCola), =(Lista, [Elemento | ListaCola]) 
%   ).