% ---- OPERACIONES CON ARCHIVOS ----

% Abrir un archivo y cerrarlo inmediatamente
prueba_archivo :-
  open('prueba.txt', write, Archivo),
  close(Archivo).

% Obtener el nombre de una persona desde un archivo y mostrarlo en pantalla
% NOTA: En este caso, el contenido debe estar entre comillas simples y terminar en punto. Si no es así se generará un error.
leer_archivo :-
  open('nombre.txt', read, DatosPersona),
  read(DatosPersona, Nombre),
  write('El nombre almacenado es: '),
  writeln(Nombre),
  close(DatosPersona).


% Solicitar el nombre de una persona y lo graba en un archivo en disco.
% NOTA: el nombre que se escribe entre comillas simples y se termina con punto. Revise el archivo

grabar_archivo :-
  write('Introduzca su nombre: '),
  read(Nombre),
  open('nombre.txt', write, DatosPersona),
  write(DatosPersona, Nombre),
  close(DatosPersona).


grabar_archivo2 :-
  write('Introduzca el nombre del archivo en disco: '),
  read(NombreArchivo),
  write('Introduzca el nombre del flujo: '),
  read(NombreFlujo),
  write('Introduzca su nombre: '),
  read(Nombre),
  open(NombreArchivo, write, NombreFlujo),
  writeln(NombreFlujo, Nombre),
  close(NombreFlujo).

% Recorrer iterativamente un archivo y mostrar su contenido en pantalla

% 1- Leer un archivo vacio
% leer_archivo_vacio :-
%   open('ArchivoVacio.txt', read, MiArchivo),
%   read(MiArchivo, Dato),
%   probar(Dato),
%   close(MiArchivo).

% probar(Dato) :-
%   ==(Dato, end_of_file),
%   writeln('Se ha llegado al final del archivo.'),
%   !.

% probar(Dato) :-
%   \==(Dato, end_of_file),
%   writeln('Todavia hay datos que leer en el archivo.').

% 2- Leer un archivo con datos
leer_archivo_no_vacio :-
  open('lista_numeros.txt', read, ListaNumeros),
  lectura(ListaNumeros),
  close(ListaNumeros).

lectura(Flujo) :-
  read(Flujo, Dato),
  probar(Dato, Flujo).

probar(Valor, Flujo) :-
  \==(Valor, end_of_file),
  writeln(Valor),
  lectura(Flujo), !.

probar(Valor, _) :-
  ==(Valor, end_of_file),
  writeln('Se ha llegado al final del archivo.').

% grabar una lista en un archivo
grabar_lista :-
  write('Digite el nombre del archivo destino: '),
  read(NombreArchivo),
  open(NombreArchivo, write, ListaNumeros),
  meter_numeros(ListaNumeros, L),
  close(ListaNumeros).

meter_numeros(_, []).

meter_numeros(Flujo, [Cabeza | Cola]) :-
  write(Flujo, Cabeza),
  write(Flujo, '.'),
  write(Flujo, '\n'),
  meter_numeros(Flujo, Cola).