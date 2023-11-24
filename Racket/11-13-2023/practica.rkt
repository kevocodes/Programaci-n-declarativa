#lang racket

#| Elabore la lisa que corresponde al árbol |#

'((((()7())10(()12()))17((()19())22(()28())))34((()43(()67()))83(()98())))

#| Recorrer un arbol binario de busqueda y desplegar los datos de sus nodos de menor a mayor |#

(define (recorrer_arbol arbol)
  (if (not (null? arbol))
    (begin
      (recorrer_arbol (first arbol))
      (displayln (second arbol))
      (recorrer_arbol (third arbol))
    )
    void
  )
)


#| Buscar un dato en el arbol binario de busqueda |#
(define (buscar_dato arbol dato)
  (if (not (null? arbol))
    (if (< dato (second arbol))
      (buscar_dato (first arbol) dato)
      (if (> dato (second arbol))
          (buscar_dato (third arbol) dato)
          (if (equal? dato (second arbol))
              (displayln "Dato encontrado")
              void
          )

      )
      )
    (displayln "Dato no ha sido encontrado")
  )
)


(define (buscar_v2 arbol dato)
  (cond
    ((< dato (second arbol)) (buscar_dato (first arbol) dato))
    ((> dato (second arbol)) (buscar_dato (third arbol) dato))
    ((equal? dato (second arbol)) (displayln "Dato encontrado"))
    (else (displayln "Dato no encontrado"))
   )
 )

#| Dado un arbol binario de busqueda y un dato, buscar dicho dato en el arbol.
Ya sea que lo encuentre o no, copiar en una lista los datos de los nodos visitados hasta llegar al nodo
que contiene el dato buscado o hasta encontrar el final de la rama|#
(define (crear_ruta arbol dato L)
  (if (not (null? arbol))
    (if (< dato (second arbol))
      (crear_ruta (first arbol) dato (append L (second arbol)))
      (if (> dato (second arbol))
          (crear_ruta (third arbol) dato (append L (list(second arbol))))
          (if (equal? dato (second arbol))
              (append L (list dato))
              void
          )

      )
      )
    L
  )
)
