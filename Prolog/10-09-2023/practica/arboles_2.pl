% 3) Insertar un elemento en un arbol binario de busqueda.
insertar_elemento([SubArbolIzq, Elemento, SubarbolDer], Elemento, [SubArbolIzq, Elemento, SubarbolDer]) :-
  writeln('El dato ya existe en el arbol'),
  writeln('No se realizo la insercion'), !.

insertar_elemento([], Elemento, [[], Elemento, []]) :- !.

insertar_elemento([SubArbolIzq, Raiz, SubarbolDer], Elemento, Respuesta) :-
  <(Elemento, Raiz),
  insertar_elemento(SubArbolIzq, Elemento, SubArbolIzquierdoInsertado),
  =(Respuesta, [SubArbolIzquierdoInsertado, Raiz, SubarbolDer]).

insertar_elemento([SubArbolIzq, Raiz, SubarbolDer], Elemento, Respuesta) :-
  >(Elemento, Raiz),
  insertar_elemento(SubarbolDer, Elemento, SubArbolDerechoInsertado),
  =(Respuesta, [SubArbolIzq, Raiz, SubArbolDerechoInsertado]).

% 4) Eliminar un nodo hoja de un arbol binario de busqueda.
eliminar_elemento_hoja([[], Elemento, []], Elemento, []) :- !. % Si el elemento es una hoja, se elimina.

eliminar_elemento_hoja([SubarbolDer, Elemento, SubArbolIzq], Elemento, [SubarbolDer, Elemento, SubArbolIzq]) :- % Si el elemento no es una hoja, no se elimina.
  writeln('El dato no es una hoja'),
  writeln('No se realizo la eliminacion'), !.

eliminar_elemento_hoja([], _, []) :- % Si el elemento no existe, no se elimina.
  writeln('El dato no existe en el arbol'),
  writeln('No se realizo la eliminacion'), !.

eliminar_elemento_hoja([SubArbolIzq, Raiz, SubarbolDer], Elemento, Respuesta) :- % Si el elemento es menor que la raiz, se elimina del subarbol izquierdo.
  <(Elemento, Raiz),
  eliminar_elemento_hoja(SubArbolIzq, Elemento, SubArbolIzquierdoEliminado),
  =(Respuesta, [SubArbolIzquierdoEliminado, Raiz, SubarbolDer]).

eliminar_elemento_hoja([SubArbolIzq, Raiz, SubarbolDer], Elemento, Respuesta) :- % Si el elemento es mayor que la raiz, se elimina del subarbol derecho.
  >(Elemento, Raiz),
  eliminar_elemento_hoja(SubarbolDer, Elemento, SubArbolDerechoEliminado),
  =(Respuesta, [SubArbolIzq, Raiz, SubArbolDerechoEliminado]).