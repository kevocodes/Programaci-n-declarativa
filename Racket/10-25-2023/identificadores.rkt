#lang racket

#| LOCAL |#
; Ejemplo: definir dos identificadores y realizar su suma.
(define (ejemploLocalDefine_02)
  (local
    (
      (define a 3)
      (define b 7)
      (define c (+ a 10))
    )
    (+ a b c)
  )
)

#| SET! |#
; Ejemplo: definir dos identificadores y realizar su suma. Luego modificar uno de ellos y volver a realizar la suma.
(define (ejemploSet)
  (local
    (
      (define a 3)
      (define b 7)
    )
    (displayln (+ a b))
    (set! a 5)
    (displayln (+ a b))
  )
)

; Elaborar version con read
(define (ejemploSetRead)
  (local
    (
      (define a 7)
      (define b 8)
    )
    (displayln (+ a b))
    (set! a (read))
    (displayln (+ a b))
  )
)

#| SET!-VALUES |#

; Ejemplo: Realice y muestre la suma de tres identificadores con valores iniciales asignados. Luego redefinan los valores de los tres identificadores y realice nuevamente la suma.
(define (ejemploSetValues a b c) 
  (displayln (+ a b c))
  (set!-values (a b c) (1 2 3))
  (displayln (+ a b c))
)

; Redefina cada uno de los identificadores con valores del teclado.
(define (ejemploSetValue_2 a b c)
  (displayln (+ a b c))
  (set!-values (a b c) (values (read) (read) (read)))
  (displayln (+ a b c))
)

#| LET y LET*|#

; Let: Realice y muestre el producto de dos identificadores
(define (ejemploLet a b)
  (let
    (
      (c (* a b))
    )
    (displayln c)
  )
)

; Let*: 
(define (ejemploLet_04)
  (let*
    (
      (a 10)
      (b (sqr 4))
      (c (* 2 a))
    )
    (* a b c)
  )
)

#| LET-VALUES Y LET*-VALUES |#

; Let-values: Inicialice dos identificadores con un mismo comando let-values, operelos y muestre el resultado.

(define (ejemploLetValues)
  (let-values 
    (
      ((x y) (values 4 3))
    )
    (displayln (+ x y))
  )
)

;Let*-values: Inicialice dos identificadores con un mismo comando y luego inicialice un tercer identificador a partir de los valores de los identificadores anteriores. Realice operaciones y muestre el resultado.

(define (ejemploLetValues_2)
  (let*-values 
    (
      ((x y) (values 4 3))
      ((z) (values (+ x y)))
    )
    (displayln (+ x y z))
  )
)