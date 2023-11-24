%Ej. 1

%Dado un ejercicio como argumento un numero N,
%Elabore una clausula recursiva que imprima
%en pantalla una letra

escribir_letra(N) :-
    N =< 0,
    writeln("Debe ingresar un numero mayor a 0."),
    !, fail.

escribir_letra(N) :-
    write("Digite la letra a repetir: "),
    read(L),
    escribir(N, L).

escribir(N, L) :-
    \+ atom(L),
    write("Debe digitar una letra"),
    !, fail.

escribir(0, _) :- !.

escribir(N, L) :-
    N > 0,
    write(L),
    N1 is N - 1,
    escribir(N1, L).


% Ej. 7
% 7. Un restaurante quiere mostrar a sus clientes información nutricional sobre la comida que ofrece en el menú. Para completar un poco la información que tenemos sobre las comidas del restaurante vamos a mirar la lista de las calorías que aporta cada plato:
% Una ración de paella aporta 200 calorías
% Una ración de gazpacho aporta 150 calorías
% Una ración de consomé aporta 300 calorías
% Una ración de filete de cerdo aporta 400 calorías
% Una ración de pollo asado aporta 280 calorías
% Una ración de trucha aporta 160 calorías
% Una ración de bacalao aporta 300 calorías
% Una ración de flan aporta 200 calorías
% Una ración de nueces con miel aporta 500 calorías
% Una ración de naranja aporta 50 calorías

% Se le pide definir:
% a. Defina la relación calorias/2 que indicará que una ración de cada
% alimentotiene de los de la lista tiene determinadas calorías. b. La regla valor_calorico(X, Y, Z, V) que indicará que las porciones X, Y y
% Z de la comida suma en total V calorías. c. Definir la cláusula comida_equilibrada(X, Y, Z) que indicará si la comida
% supera o no las 800 calorías.

calorias(paella, 200).
calorias(gazpacho, 150).
calorias(consome, 300).
calorias(filete, 400).
calorias(pollo, 280).
calorias(trucha, 160).
calorias(bacalao, 300).
calorias(flan, 200).
calorias(nueces, 500).
calorias(naranja, 50).

valor_calorico(X, Y, Z, V) :-
    calorias(X, A),
    calorias(Y, B),
    calorias(Z, C),
    V is A + B + C.

valor_calorico(X, Y, Z) :-
  valor_calorico(X, Y, Z, V),
  V =< 800,
  writeln("Comida equilibrada").

valor_calorico(X, Y, Z) :-
  valor_calorico(X, Y, Z, V),
  V > 800,
  writeln("Comida no equilibrada"),
  fail.

% 6. El enemigo de mi enemigo, es mi amigo. La historia de la humanidad está plagada de guerras. Reyes, presidentes, conquistadores y estrategas de las batallas han debido conseguir, cuando es necesario, aliados para vencer a su oponente. Elabore la regla aliado/3 en la que el primer argumento es alguien que quiere vencer a la persona indicada en el segundo argumento. El tercer argumento es el posible aliado del primero. La cláusula debe verificar si los primeros dos son enemigos mutuos y luego verificar si el tercer argumento es enemigo del segundo. Elabore la relación enemigo/2 para varios individuos y pruebe la regla elaborada.

enemigo(rusia, ucrania).
enemigo(ucrania, rusia).
enemigo(rusia, japon).
enemigo(japon, rusia).
enemigo(usa, rusia).
enemigo(rusia, usa).
enemigo(china, usa).
enemigo(usa, china).
enemigo(usa, cuba).
enemigo(cuba, usa).

no_enemigo(X, Y) :-
  not(enemigo(X, Y)),
  not(enemigo(Y, X)).

aliado(X, Y, Z) :-
  no_enemigo(X, Y),
  no_enemigo(X, Z),
  no_enemigo(Y, Z),
  dif(X, Y),
  dif(X, Z),
  dif(Y, Z).

% Ej que vendrá en el corto
% clausula de aridad 2
% parametro 1: numero
% parametro 2: suma de digitos del numero
sumardigitos(N, M) :- 
  number(N),
  sumar(N, 0, M).

sumar(0, M, M) :- !.

sumar(N, V, M) :-
  N > 0,
  Res is N mod 10,
  C is N // 10,
  V1 is V + Res,
  sumar(C, V1, M).

% 3. Pepito se escapó de su casa y se fue con sus amigos al centro comercial. Estando
% allí se da cuenta de que sus papas también han ido de compras. Elabore una base
% de conocimiento que le ayude a Pepito a no “encontrarse” con sus papás en ningún
% lugar del centro comercial, es decir, la base de conocimiento debe conocer los
% locales y decirle a Pepito en qué lugares del centro comercial podrá estar sin ser
% visto. En muchas ocasiones su papá y su mamá deciden separarse e ir a locales
% distintos para terminar las compras más rápido. Elabore una regla de aridad tres a
% la que se le indique por medio de dos argumentos en cuál local está su mamá y en
% cuál está su papá. En el tercer argumento de la cláusula se devuelven los locales
% en los que Pepito puede estar.

local(1, tienda_de_ropa).
local(2, tienda_de_electronicos).
local(3, cafeteria).
local(4, jugueteria).
local(5, zapateria).
local(6, libreria).
local(7, joyeria).

padres_en_local(LocalPapa, LocalMama, LocalesSeguros) :-
    local(LocalPapa, _),
    local(LocalMama, _),
    findall(Local, (
        local(Local, _),
        Local \= LocalPapa,
        Local \= LocalMama
    ), LocalesSeguros).

