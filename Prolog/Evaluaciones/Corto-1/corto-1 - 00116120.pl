% Corto 1 - Programación declarativa
% Escobar Vásquez Kevin Jefferson - 00116120

% Hechos para las fases de la metamorfosis de una rana
fase_metamorfosis_rana(huevo).
fase_metamorfosis_rana(hembrion).
fase_metamorfosis_rana(renacuajo).
fase_metamorfosis_rana(renacuajo_dos_patas).
fase_metamorfosis_rana(renacuajo_cuatro_patas).
fase_metamorfosis_rana(rana_cola_corta).
fase_metamorfosis_rana(rana_adulta).

% Relaciones para llegar de una fase a otra
fase_anterior(huevo, hembrion).
fase_anterior(hembrion, renacuajo).
fase_anterior(renacuajo, renacuajo_dos_patas).
fase_anterior(renacuajo_dos_patas, renacuajo_cuatro_patas).
fase_anterior(renacuajo_cuatro_patas, rana_cola_corta).
fase_anterior(rana_cola_corta, rana_adulta).


% Regla de aridad 1 para mostrar las fases siguientes de la metamorfosis de una rana hasta la última
siguientes_fases() :- 
  write('-- Error: debes ingresar una fase --'),
  fail.

siguientes_fases(rana_adulta) :-
  writeln('--- No hay mas fases a mostrar ---'),
  !.

siguientes_fases(FaseInicial) :-
  \+ fase_metamorfosis_rana(FaseInicial),
  write('-- Error: la fase ingresada no existe --'),
  !, fail.

siguientes_fases(FaseInicial) :-
    fase_anterior(FaseInicial, FaseSiguiente),
    writeln(FaseSiguiente),
    siguientes_fases(FaseSiguiente).