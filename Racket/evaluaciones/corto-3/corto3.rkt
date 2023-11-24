#lang racket

; Pregunta 1)
(define (probXYZ x)
  (case
    ((and (> x -7) (<= x -3))
      (display "Primer rango")
    )
    ((and (> x -3) (< x 0))
      (display "Segundo rango")
    )
    ((and (> x 0) (< x 5))
      (display "Tercer rango rango")
    )
  )
)

; Pregunta 2)
(define (probABC x)
  (cond
    ((1 3 5 7 9)
      (display "Impares")
    )
    ((2 4 6 8)
      (display "Pares")
    )
    (else
      (display "Nada")
    )
  )
)

; Pregunta 3)
(define (retornar X)
  (if (equal? X 0)
    (null)
    (void)
  )
)

; Pregunta 4)
(define (problemalf x)
  (if x
    (display "Hola")
    (display "Adios")
  )
)

; pregunta 5)
(define (problema x)
  (cond
    ((< x 0)
      (display "El valor es menor que ")
      (display 0)
    )
    ((equal? x 0)
      (display "El valor es ")
      (display 0)
    )
    ((> x 0)
      (display "El valor es mayor que ")
      (display 0)
    )
  )
)

; Pregunta 6)
(define (devolver opcion x)
  (if (equal? opcion 1)
    (list
      (+ 2 x)
      (- 2 x)
    )
    (values
      (- 2 x)
      (/ 2 x)
    )
  )
)

; Pregunta 7)
; (define (funcion)
;   (list 5 10)
; )

; (define (ejemploLetValues_02)
;   (let-values
;     (
;       ((a b) (funcion))
;       ((c) (+ a b))
;     )
;     (* a b c)
;   )
; )
