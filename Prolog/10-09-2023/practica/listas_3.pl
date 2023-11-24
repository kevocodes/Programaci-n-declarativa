% ---- OPERACIONES CON LISTAS ----

% Eliminar el primer elemento de una lista
eliminar_primero([_|Cola], Cola) :- !.


% Elabore una regla que elimine un elemento determinado de una lista. Si el elemento no existe, la lista queda igual. Si el elemento se encuentra al eliminarlo los demas elementos quedan en el mismo orden relativo.

% [1,2,3,4,5]; eliminar 3 -> [1,2,4,5]

eliminar_elemento([], _, []) :- !.

eliminar_elemento([Elemento | Cola], Elemento, Cola) :- !.

eliminar_elemento([Cabeza | Cola], Elemento, Respuesta) :-
  %\==(Cabeza, Elemento), %-> No es necesaria
  eliminar_elemento(Cola, Elemento, RespuestaAux),
  =(Respuesta, [Cabeza | RespuestaAux]). % -> Se pude omitir poniendo en el tercer arg. [Cabeza | RespuestaAux]

% Consulta: ? - eliminar_elemento([1,2,3,4,5], 3, Respuesta). -> Respuesta = [1,2,4,5]

% % [1,2,3,4,5], 3, Respuesta = [1,2,4,5]
% eliminar_elemento([Cabeza | Cola], Elemento, Respuesta) :-
%   %\==(Cabeza, Elemento), %-> No es necesaria
%   eliminar_elemento(Cola, Elemento, RespuestaAux), % RespuestaAux = [2,4,5]
%   =(Respuesta, [Cabeza | RespuestaAux]). % Respuesa = [1 | [2,4,5]] = [1,2,4,5]

% % [2,3,4,5], 3, Respuesta = [2,4,5]
% eliminar_elemento([Cabeza | Cola], Elemento, Respuesta) :-
%   %\==(Cabeza, Elemento), %-> No es necesaria
%   eliminar_elemento(Cola, Elemento, RespuestaAux), % RespuestaAux = [4,5]
%   =(Respuesta, [Cabeza | RespuestaAux]). % Respuesa = [2 | [4,5]] = [2,4,5]

% % [3,4,5], 3, Respuesta = [4, 5]
% eliminar_elemento([Elemento | Cola], Elemento, Cola) :- !.




% Elabore una regla que elimine todas las ocurrencias de dicho elemento de la lista.

eliminar_ocurrencias([], _, []) :- !.

eliminar_ocurrencias([Elemento | Cola], Elemento, RespuestaAux) :-
  eliminar_ocurrencias(Cola, Elemento, RespuestaAux), 
  !.

eliminar_ocurrencias([Cabeza | Cola], Elemento, Respuesta) :-
  \==(Cabeza, Elemento), %-> No es necesaria
  eliminar_ocurrencias(Cola, Elemento, RespuestaAux),
  =(Respuesta, [Cabeza | RespuestaAux]). % -> Se pude omitir poniendo en el tercer arg. [Cabeza | RespuestaAux]