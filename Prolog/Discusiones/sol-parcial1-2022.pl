% Ejercicio 1

% Calcular la suma de los digitos de un numero

calc(0,_,_,_,_):- !.

calc(A,C,B,D,E):-
    sumardigitos(A,B,C,D,E).

sumardigitos(N,M,D,P,I):-
    number(N),
    sumar(N,0,M,0,D,0,P,0,I).

sumar(0,M,M,D,D,P,P,I,I):- !.

sumar(N,V,M,AuxD,D,AuxP,P,AuxI,I):-
    >(N,0),
    is(C,//(N,10)),
    is(Res, mod(N,10)),
    =:=(mod(Res,2),0),
    is(AuxP1, +(AuxP, 1)),
    is(V1, +(V,Res)),
    is(AuxD1, +(AuxD, 1)),
    sumar(C,V1,M,AuxD1,D,AuxP1,P,AuxI,I), !.

sumar(N,V,M,AuxD,D,AuxP,P,AuxI,I):-
    >(N,0),
    is(C,//(N,10)),
    is(Res, mod(N,10)),
    not(=:=(mod(Res,2),0)),
    is(AuxI1, +(AuxI, 1)),
    is(V1, +(V,Res)),
    is(AuxD1, +(AuxD, 1)),
    sumar(C,V1,M,AuxD1,D,AuxP,P,AuxI1,I), !.

%----------------------------------------

% Ejercicio 2

% Realizar un contador de un elemento segun su columna

contador_elemento([],_,0):- !.

contador_elemento([X|Col],X,Cont):- 
    contador_elemento(Col,X,Cont1),
    is(Cont,+(Cont1,1)),!.

contador_elemento([_|Col],X,Cont):- 
    contador_elemento(Col,X,Cont1),
    is(Cont,Cont1).

%----------------------------------------

%Metamorfosis de la rana
%Consulta a una base cualquiera

fase(huevo).
fase(embrion).
fase(renacuajo).
fase(renacuajo_con_dos_patas).
fase(renacuajo_con_cuatro_patas).
fase(rana_de_cola_corta).
fase(rana_adulta).

se_transforma_en(huevo, embrion).
se_transforma_en(embrion, renacuajo).
se_transforma_en(renacuajo, renacuajo_con_dos_patas).
se_transforma_en(renacuajo_con_dos_patas, renacuajo_con_cuatro_patas).
se_transforma_en(renacuajo_con_cuatro_patas, rana_de_cola_corta).
se_transforma_en(rana_de_cola_corta, rana_adulta).


fases_rana(Fase):-
    %La variable de prolog
    var(Fase),
    writeln("huevo"),
    fases_rana(huevo),
    !.

fases_rana(Fase):-
    not(fase(Fase)),
    writeln("Nombre de fase no valido"),
    !.

fases_rana(Fase):-
    %Variable temporal
    not(se_transforma_en(Fase,_)),
    writeln("Fin de la metamorfosis"),
    !.

fases_rana(Fase):-
    se_transforma_en(Fase, W),
    writeln(W),
    fases_rana(W).