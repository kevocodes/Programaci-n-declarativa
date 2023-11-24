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

; Derivada de x a la n:
; Se invoca así: > (dXN 'x '(expt x 5))
(define (dXN Var Expresion)
  (if (equal? (first Expresion) 'expt)
      (if (and (equal? (second Expresion) Var) (number? (third Expresion)))
          (list '* (third Expresion) (list 'exp Var (sub1 (third Expresion))))
          (display "Expresión no válida")
      )
      (display "Expresión no válida")
  )
)

; Derivada de a a la x;
; Se invoca asi: > (dAX 'x '(expt 5 x))
(define (dAX Var Expresion)
  (if (equal? (first Expresion) 'expt)
      (if (and (number? (second Expresion)) (equal? (third Expresion) Var))
          (list '* Expresion (list 'log (second Expresion)))
          (display "Expresión no válida")
      )
      (display "Expresión no válida")
  )
)


(define (d Var Expresion)
  (cond 
    ((number? Expresion) 0)
    ((equal? Expresion Var) 1)
    (else 
      (let* 
        (
          (u (second Expresion))
          (v (third Expresion))
        )
        (case (first Expresion)
          ((expt) 
            (if (and (equal? u Var) (number? v))
              (list '* v (list 'expt Var (sub1 v)))
              (void)
            )
          )
          ((*)
            (if (and (list? u) (list? v))
              (list (list '+ (list '* (d Var u) v) (list '* (d Var v))))
              (void)
            )
          )
        )
      )
    )
  )
)