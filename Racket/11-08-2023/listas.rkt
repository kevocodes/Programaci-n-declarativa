#lang racket

; Verificar la cantidad de apariciones de un elemento en una lista
(define (contarElto L Elto)
  (if (not (empty? L))
    (if (equal? (first L) Elto)
      (+ 1 (contarElto (rest L) Elto))
      (contarElto (rest L) Elto)
    )
    0
  )
)

#| Elabore un programa que cree una lista a partir de elementos que se
leen desde teclado Para finalizar la lectura introduzca -1 |#

(define (llenarLista)
  (let
    (
      (elto (read))
    )
    (if (not (equal? elto -1))
      (append (list elto) (llenarLista))
      `()
    )
  )
)

#| Elabore una funcion que reciba una lista e imprima cada elemento de la misma linea por linea |#


#| Elabore una funcion que retorne la suma de todos los elementos de una lista. |#

#| Elabore una funcion que reciba una lista y retorne otra con los datos en orden inverso.
No utilice la funcion predefinida reverse |#

#| Elabore una funcion que, dada una cadena de caracteres, retorne una lista cuyos elementos sean los caracteres de la
cadena colocados en el mismo orden. No utilice el comando string->list.
Investigue sobre los comandos string->list y list->string|#