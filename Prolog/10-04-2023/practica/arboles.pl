% [[[[], 1, []], 3, [[], 4, []]], 5, [[], 9, [[], 11, []]]]
% Arbol binario -> [SubArbolIzq, Raiz, SubArbolDer]

% Representacion de arboles binarios con listas

% Se usara representacion infija o inorden [subarbolIzq, dato, subarbolDer]
            %            5
            %         /    \
            %        3      9
            %      /  \    /   \
            %    1     4   7    11
            %   / \   / \ / \  /  \
            % []  [] [] [][] [][]  []

% Representacion en prolog
% [[[[], 1, []], 3, [[], 4, []]], 5, [[[], 7, []], 9, [[], 11, []]]]

% Representacion en prolog
% [[[[], 1, []], 3, [[], 4, []]], 5, [[] ,9, [[], 11, []]]]

% ---- Operaciones con árboles binarios ----
% Recorridos de arboles binarios
% A) Preorden
mostrarArbolPreorden([]).

mostrarArbolPreorden([SubIzq, Dato, SubDer]):-
    writeln(Dato),
    mostrarArbolPreorden(SubIzq),
    mostrarArbolPreorden(SubDer).

% B) Postorden
mostrarArbolPostorden([]).

mostrarArbolPostorden([SubIzq, Dato, SubDer]):-
  mostrarArbolPostorden(SubIzq),
  mostrarArbolPostorden(SubDer),
  writeln(Dato).

% C) Inorden u Orden central
mostrarArbolInorden([]).

mostrarArbolInorden([SubIzq, Dato, SubDer]):-
    mostrarArbolInorden(SubIzq),
    writeln(Dato),
    mostrarArbolInorden(SubDer).

% ---- Operaciones con arboles binarios de busqueda ----
% 1) Elabore un programa que, dado un numero y un arbol binario de busqueda, realice la 
% busqueda de dicho numero en el arbol y retorne un mensaje indicando si el numero se
% encuentra o no en el arbol.

% Arbol:
%           70
%         /    \
%        31     93
%      /  \    /   \
%    14    [] []   94
%   / \           /  \
% []  23         []  []
%       \
%        []

% Representacion en prolog
% [[[[], 14, [[], 23, []]], 31, []], 70, [[], 93, [[], 94, []]]]

buscarArbolBinario([], _) :- writeln('El numero no se encuentra en el arbol'), !, fail.

buscarArbolBinario([_, Numero, _], Numero) :- writeln('El numero se encuentra en el arbol'), !.

buscarArbolBinario([SubArbolIzq, Valor, _], Numero) :-
  <(Numero, Valor),
  buscarArbolBinario(SubArbolIzq, Numero), !.

buscarArbolBinario([_, Valor, SubArbolDer], Numero) :-
  >(Numero, Valor),
  buscarArbolBinario(SubArbolDer, Numero).

% 2) La altura de un arbol se calcula en base a la cantidad de nodos recorrdos en el camino mas largo de la raiz a una hoja en una un arbol. Haga un programa en Prolog que calcule la altura de un arbol.

% Arbol:
%           70
%         /    \
%        31     93
%      /  \    /   \
%    14    [] []   94
%   / \           /  \
% []  23         []  []

% Representacion en prolog
% [[[[], 14, [[], 23, []]], 31, []], 70, [[], 93, [[], 94, []]]]


alturaArbolBinario([], 0) :- !.

alturaArbolBinario([SubArbolIzq, _ , SubarbolDer], Respuesta) :-
  alturaArbolBinario(SubArbolIzq, AlturaIzq),
  alturaArbolBinario(SubarbolDer, AlturaDer),
  is(Respuesta, max(AlturaIzq, AlturaDer) + 1).

% consulta: ?- alturaArbolBinario([[[[], 14, [[], 23, []]], 31, []], 70, [[], 93, [[], 94, []]]], Respuesta). -> Respuesta = 4

% % 0- [[[[], 14, [[], 23, []]], 31, []], 70, [[], 93, [[], 94, []]]] -> Respuesta = 4
% alturaArbolBinario([SubArbolIzq, _ , SubarbolDer], Respuesta) :-
%   alturaArbolBinario(SubArbolIzq, AlturaIzq), % [[[[], 14, [[], 23, []]], 31, []], AlturaIzq = 3
%   alturaArbolBinario(SubarbolDer, AlturaDer),
%   is(Respuesta, max(AlturaIzq, AlturaDer) + 1). % max(3, 2) = 3; Respuesta = 3 + 1 = 4

% %1- [[[[], 14, [[], 23, []]], 31, []] -> Respuesta = 3
% alturaArbolBinario([SubArbolIzq, _ , SubarbolDer], Respuesta) :-
%   alturaArbolBinario(SubArbolIzq, AlturaIzq), % [[[[], 14, [[], 23, []]], AlturaIzq = 2
%   alturaArbolBinario(SubarbolDer, AlturaDer), % [], AlturaDer = 0
%   is(Respuesta, max(AlturaIzq, AlturaDer) + 1). % max(2, 0) = 2; Respuesta = 2 + 1 = 3


% %1.1- [[[[], 14, [[], 23, []]] -> Respuesta = 2
% alturaArbolBinario([SubArbolIzq, _ , SubarbolDer], Respuesta) :-
%   alturaArbolBinario(SubArbolIzq, AlturaIzq), % [], AlturaIzq = 0
%   alturaArbolBinario(SubarbolDer, AlturaDer), % [[], 23, []], AlturaDer = 1

%   is(Respuesta, max(AlturaIzq, AlturaDer) + 1). % max(0, 1) = 1; Respuesta = 1 + 1 = 2

% %1.1.1- [] -> Respuesta = 0
% alturaArbolBinario([], 0) :- !.

% %1.1.2- [[], 23, []] -> Respuesta = 1
% alturaArbolBinario([SubArbolIzq, _ , SubarbolDer], Respuesta) :-
%   alturaArbolBinario(SubArbolIzq, AlturaIzq), % [], AlturaIzq = 0
%   alturaArbolBinario(SubarbolDer, AlturaDer), % [], AlturaDer = 0
%   is(Respuesta, max(AlturaIzq, AlturaDer) + 1). % max(0, 0) = 0; Respuesta = 0 + 1 = 1

% % 1.1.2.1- [] -> Respueta = 0
% alturaArbolBinario([], 0) :- !.

% % 1.1.2.2- [] -> Respuesta = 0
% alturaArbolBinario([], 0) :- !.



% version sin funcion max
% alturaArbolBinario([SubArbolIzq, _ , SubarbolDer], Respuesta) :-
%   alturaArbolBinario(SubArbolIzq, AlturaIzq),
%   alturaArbolBinario(SubarbolDer, AlturaDer),
%   (
%     >(AlturaIzq, AlturaDer), is(Respuesta, +(AlturaIzq, 1)), !;
%     is(Respuesta, +(AlturaDer, 1))
%   ).


