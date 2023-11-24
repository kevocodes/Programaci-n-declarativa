%------------------------------------------
% Paz Quinteros Erika Andrea 00117420
% Escobar Vásquez Kevin Jefferson 00116120
%------------------------------------------

%Ejercicio 1: Casa de Rodri

%Hechos
lugar(calle).
lugar(cochera).
lugar(sala).
lugar(cuarto_de_estudio).
lugar(cocina).
lugar(comedor).
lugar(pasillo_1).
lugar(banio).
lugar(cuarto_papas).
lugar(pasillo_2).
lugar(cuarto_de_rodri).
lugar(lavadero).
lugar(jardin).
lugar(quiosco).

%Relaciones
conecta_con(calle, cochera).
conecta_con(cochera, calle).
conecta_con(cochera, sala).
conecta_con(sala, cochera).
conecta_con(sala, pasillo_1).
conecta_con(pasillo_1, sala).
conecta_con(pasillo_1, cuarto_de_estudio).
conecta_con(pasillo_1, comedor).
conecta_con(pasillo_1, cocina).
conecta_con(pasillo_1, pasillo_2).
conecta_con(cuarto_de_estudio, pasillo_1).
conecta_con(comedor, pasillo_1).
conecta_con(cocina, pasillo_1).
conecta_con(cocina, lavadero).
conecta_con(pasillo_2, pasillo_1).
conecta_con(pasillo_2, banio).
conecta_con(pasillo_2, cuarto_papas).
conecta_con(pasillo_2, jardin).
conecta_con(pasillo_2, cuarto_de_rodri).
conecta_con(banio, pasillo_2).
conecta_con(cuarto_papas, pasillo_2).
conecta_con(cuarto_de_rodri, pasillo_2).
conecta_con(jardin, pasillo_2).
conecta_con(jardin, quiosco).
conecta_con(quiosco, jardin).
conecta_con(lavadero, cocina).

% Regla ir_hacia/2  
:- dynamic(ruta/1).

ir_hacia(Origen, Destino):-
  abolish(ruta, 1),
  assert(ruta(Origen)),
  ir_hacia_rec(Origen, Destino),
  writeln(Origen).

ir_hacia_rec(Origen, Destino):-
  conecta_con(Origen, Destino),
  writeln(Destino),
  assert(ruta(Destino)),
  !.

ir_hacia_rec(Origen, _):-
  conecta_con(Origen, Dest_temp),
  ruta(Dest_temp),
  fail.

ir_hacia_rec(Origen, Destino):-
  conecta_con(Origen, Dest_temp),
  not(ruta(Dest_temp)),
  assert(ruta(Dest_temp)),
  ir_hacia_rec(Dest_temp, Destino),
  writeln(Dest_temp),
  !.

% --------------------------------------------------------

% Ejercicio 2: ASIMO

% Hechos
objeto(pantunflas).
objeto(flores).
objeto(pisto).
objeto(agua).
objeto(limones).
objeto(papel_higienico).
objeto(revista_3x).

% Relaciones
esta_en(pantunflas, cuarto_de_rodri).
esta_en(flores, jardin).
esta_en(pisto, cuarto_papas).
esta_en(agua, cocina).
esta_en(limones, jardin).
esta_en(papel_higienico, banio).
esta_en(revista_3x, quiosco).

% Reglas traer/2
traer(Origen, _):-
  \+ lugar(Origen),
  writeln("El origen no es valido, prueba de nuevo."),
  !, fail.

traer(_, Objeto):-
  \+ objeto(Objeto),
  writeln("El objeto no es valido, prueba de nuevo."),
  !, fail.

traer(Origen, Objeto):-
  esta_en(Objeto, Destino),
  busqueda(Origen, Destino).
  
busqueda(Origen, Destino):-
  ==(Origen, Destino),
  writeln(Origen),
  !.

busqueda(Origen, Destino):-
  ir_hacia(Origen, Destino),
  writeln("----------------------"),
  ir_hacia(Destino, Origen).
