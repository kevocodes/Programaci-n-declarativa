#lang racket


(define (suma a b)
  (+ a b)
)

#| Ejercicio 1: Calcular perimetro de circunferencia |#
(define (perimetroCircunferencia r)
  (* 2 (* pi r))
)

#| Ejercicio 2: Calcular el area de un triangulo rectangulo |#
(define (areaTriangulo b h)
  (/ (* b h) 2)
)

#| Ejercicio 3: Calcular la distancia entre dos puntos |#

(define (distancia x1 y1 x2 y2)
  (sqrt (+ (sqr (- x2 x1)) (sqr (- y2 y1))))
)

#| Ejercicio 4: Escriba una funcion que indique si un numero es cuadrado perfecto. |#

(define (cuadradoPerfecto n)
  (integer? (sqrt n))
)

#| Ejercicio 5: Para cada uno de los siguientes literales indique si el valor recibido esta dentro o fuera del intervalo que se especifica
|#

; Intervalo (3, 7]
(define (intervalo1 n)
  (and (> n 3) (<= n 7))
)

; Intervalo [3, 7]
(define (intervalo2 n)
  (and (>= n 3) (<= n 7))
)

; Intervalo [3, 9).
(define (intervalo3 n)
  (and (>= n 3) (< n 9))
)

; La union de los intervalos (1, 3) y (9, 11)
(define (intervalo4 n)
  (or (and (> n 1) (< n 3)) (and (> n 9) (< n 11)))
)


; Ejemplo:
; Utilizar la ecuación cuadrática para calcular las raíces de ecuaciones de la forma
; ax2+bx+c. Por ejemplo, las raíces de x^2+3x+2 son -1 y -2.

; Versión 1:
(define (raizCuadratica a b c)
  (/ (+ (- b) (sqrt (- (sqr b) (* 4 a c)))) (* 2 a))
  (/ (- (- b) (sqrt (- (sqr b) (* 4 a c)))) (* 2 a))
)

; Notar que solo se retorna uno de los valores. Pero necesitamos que se desplieguen
; los dos.Otra versión podría ser la siguiente:

; Versión 2:
(define (raizCuadratica2 a b c)
  (display (/ (+ (- b) (sqrt (- (sqr b) (* 4 a c)))) (* 2 a)))
  (display "\n")
  (display (/ (- (- b) (sqrt (- (sqr b) (* 4 a c)))) (* 2 a)))
)
; Pero esta versión no retorna los valores, más bien los despliega en pantalla.

; Versión 3:
(define (raizCuadratica3 a b c)
  (list
    (/ (+ (- b) (sqrt (- (sqr b) (* 4 a c)))) (* 2 a))
    (/ (- (- b) (sqrt (- (sqr b) (* 4 a c)))) (* 2 a))
  )
)
; Esta versión sí retornar los valores a otra función que invoque a esta función.
0.30000000000000004
; Pero ojo, solo retorna un elemento, que es la lista con los dos valores calculados en su interior. La función que recibe esta lista debe entrar a la lista y obtener los valores individuales.

; Versión 4:
(define (raizCuadratica4 a b c)
  (values
    (/ (+ (- b) (sqrt (- (sqr b) (* 4 a c)))) (* 2 a))
    (/ (- (- b) (sqrt (- (sqr b) (* 4 a c)))) (* 2 a))
  )
)
; Esta versión sí retornar los valores a otra función que invoque a esta función. La función receptora debe estar preparada para recibir ambos valores, eso lo veremos más adelante.