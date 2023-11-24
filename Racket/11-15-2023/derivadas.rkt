#lang racket

; Las siguientes son funciones que calculan
; derivadas que no requieren de recursión:

; Derivada de una constante:
; Se invoca así: > (dCte 'x 5)
(define (dCte Var Expresion)
  (if (number? Expresion)
      0
      (display "Expresión no válida")
  )
)



; Derivada de x respecto a x:
; Se invoca así: > (dX 'x 'x)
(define (dX Var Expresion)
  (if (equal? Expresion Var)
      1
      (display "Expresión no válida")
  )
)



; Derivada de una constante por x:
; Se invoca así: > (dKX 'x '(* 5 x))
(define (dKX Var Expresion)
  (if (equal? (first Expresion) '*)
      (if (and (number? (second Expresion)) (equal? (third Expresion) Var))
          (second Expresion)
          (display "Expresión no válida")
      )
      (display "Expresión no válida")
  )
)

