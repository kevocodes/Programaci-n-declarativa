#lang racket

; Veamos la solución de un sencillo problema utilizando ambos métodos: un programa que realiza un conteo en el intervalo de 1 a n. 

; a) Utilizando recursión de cola:
(define (contarHasta_v1 n)
  (if (and (positive? n) (integer? n))
    (contarAux_v1 1 n)
    (display "Valor ingresado no válido")
  )
)

(define (contarAux_v1 cont limSup)
  (if (< cont limSup)
    (begin
      (display cont)
      (display "\n")
      (contarAux_v1 (+ cont 1) limSup)
    )
    (begin
      (display cont)
      (display "\n")
    )
  )
)

; b) Utilizando posposición de trabajo:
(define (contarHasta_v2 n)
  (if (and (positive? n) (integer? n))
    (contarAux_v2 n)
    (display "Valor ingresado no válido")
  )
)

(define (contarAux_v2 cont)
  (if (> cont 1)
    (begin
      (contarAux_v2 (- cont 1))
      (display cont)
      (display "\n")
    )
    (begin
      (display cont)
      (display "\n")
    )
  )
)