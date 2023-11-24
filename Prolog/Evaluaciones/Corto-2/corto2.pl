%------------------------------------------
% Paz Quinteros Erika Andrea 00117420
% Escobar Vásquez Kevin Jefferson 00116120
%------------------------------------------

% ---- EJERCICIO 1 ----

calcular_m(X1, Y1, X2, Y2, M):-
  number(X1),
  number(Y1),
  number(X2),
  number(Y2),
  is(M, (Y2-Y1)/(X2-X1)). 

calcular_b(X1, Y1, M, B) :-
  number(X1),
  number(Y1),
  number(M),
  is(B, Y1-(M*X1)).

generar_ecuacion_recta(X1, Y1, X2, Y2) :-
  calcular_m(X1, Y1, X2, Y2, M),
  calcular_b(X1, Y1, M, B),
  abolish(evaluar_recta/2),
  assert((evaluar_recta(X, Y) :- is(Y, M*X + B))).

% ---- EJERCICIO 2 ----

crearSecuencia([], []).


crearSecuencia([[Cantidad, Caracter] | RestoEntrada], [Secuencia | RestoSalida]) :-
    crearSecuencia(RestoEntrada, RestoSalida),
    crearSecuenciaAux(Cantidad, Caracter, Secuencia).

crearSecuenciaAux(0, _, []).

crearSecuenciaAux(Cantidad, Caracter, [Caracter | Resto]) :-
    Cantidad > 0,
    is(NuevaCantidad, Cantidad - 1),
    crearSecuenciaAux(NuevaCantidad, Caracter, Resto).