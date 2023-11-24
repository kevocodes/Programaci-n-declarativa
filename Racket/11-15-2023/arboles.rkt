#lang racket

#| Dado un arbol binario resuelva el problema de intercambiar los subarboles izquierdo y derecho que dependen de la raiz del arbol|#

(define (invertir_subarboles arbol)
  (if (not (empty? arbol))
  (list (third arbol) (second arbol) (first arbol))
  `()
  )
)

#| Dado un arbol binario resuelva el problema de intercambiar los subarboles izquierdo y derecho que dependen de
determinado nodo que se indica. |#

(define (invertir_subarboles_nodo arbol nodo)
  (if (not (empty? arbol))
    (if (< nodo (second arbol))
      (list (invertir_subarboles_nodo (first arbol ) nodo) (second arbol) (third arbol))
      (if (> nodo (second arbol))
        (list (first arbol) (second arbol) (invertir_subarboles_nodo (third arbol ) nodo))
        (list (third arbol) (second arbol) (first arbol))
      )
    )
    `()
  )
)

#| Dado un arbol binario resuelva el problema de intercambiar los subarboles de todos los
nodos de un arbol. |#

(define (invertir_todos_subarboles arbol)
  (if (not (empty? arbol))
  (list (invertir_todos_subarboles (third arbol)) (second arbol) (invertir_todos_subarboles (first arbol)))
  `()
  )
)