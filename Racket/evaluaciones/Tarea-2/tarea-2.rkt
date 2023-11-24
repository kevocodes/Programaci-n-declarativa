#| INTEGRANTES
------------------------------------------
% Paz Quinteros Erika Andrea 00117420
% Escobar Vásquez Kevin Jefferson 00116120
------------------------------------------ 
|#

#|
  ---- DOCUMENTACIÓN DE PARA CALCULAR EL AREA BAJO LA CURVA ----
  funcion: area-bajo-la-curva
  parametros: 
  - expresion: expresion a integrar
  - lim-inf: limite inferior de integracion
  - lim-sup: limite superior de integracion
  retorno:
  - integral: integral de la expresion
  - area: area bajo la curva

  Casos de prueba:
  1) Integrar una constante numerica
  - (area-bajo-la-curva 5 2 5) -> f(x)=∫5dx; 2<=x<=5, R: 15.0
  2) Integrar una variable
  - (area-bajo-la-curva 'x 2 5) -> f(x)=∫xdx; 2<=x<=5, R: 10.5
  3) Integrar una variable elevada a una potencia
  - (area-bajo-la-curva '(expt x 2) 2 5) -> f(x)=∫x^2dx; 2<=x<=5, R: 39.0
  4) Integrar una constante por una variable
  - (area-bajo-la-curva '(* 5 x) 2 5) -> f(x)=∫5xdx; 2<=x<=5, R: 52.5
  5) Integrar una constante por una variable elevada a una potencia
  - (area-bajo-la-curva '(* 5 (expt x 2)) 2 5) -> f(x)=∫5x^2dx; 2<=x<=5, R: 195.0
  6) Integrar una suma de funciones
  - (area-bajo-la-curva '(+ (* 5 x) (* 2 (expt x 2))) 2 5) -> f(x)=∫(5x+2x^2)dx; 2<=x<=5, R: 130.5
  7) Integrar una resta de funciones
  - (area-bajo-la-curva '(- (* 5 x) (* 2 (expt x 2))) 2 5) -> f(x)=∫(5x-2x^2)dx; 2<=x<=5, R: -25.5
  8) Integral un polinomio
  - (area-bajo-la-curva '(+ (+ (* -2 (expt x 3)) (* 3 (expt x 2))) 2) 2 5) -> f(x)=∫(-2x^3+3x^2+2)dx ≡ f(x)=∫[(-2x^3+3x^2)+2]dx ; 2<=x<=5, R: -181.5

  Casos de error:
  1) Limite inferior mayor que el limite superior
  - (area-bajo-la-curva 'x 5 2) ->  f(x)=∫xdx; 5<=x<=2, R: El limite inferior es mayor que el limite superior
  2) Limite inferior no es un numero
  - (area-bajo-la-curva 'x 'a 2) ->  f(x)=∫xdx; a<=x<=2, R: Los limites de integracion no son numeros
  3) Limite superior no es un numero
  - (area-bajo-la-curva 'x 2 'a) ->  f(x)=∫xdx; 2<=x<=a, R: Los limites de integracion no son numeros
  4) Expresion a integrar no es valida
  - (area-bajo-la-curva 'xxx 2 5) ->  f(x)=∫xdx; 2<=x<=5, R: La expresion a integrar no es válida
|#

#lang racket

#| INTEGRALES PARA EL CALCULO DEL AREA BAJO LA CURVA |#

; Integral de una constante numerica K -> 5 retorna '(* 5 x)
(define (integral-cte variable expresion)
  (if (number? expresion)
    `(* ,expresion ,variable)
    (display "La expresion no es una constante numerica")
  )
)

; Integral de una variable -> 'x retorna '(/ (expt x 2) 2)
(define (integral-var variable expresion)
  (if (equal? variable expresion)
    `(/ (expt ,expresion 2) 2)
    (display "La expresion no es la variable a integrar")
  )
)

; Integral de una variable elevada a una potencia -> '(expt x 2) retorna '(/ (expt x 3) 3)
(define (integral-pot variable expresion)
    (if (and (list? expresion) (equal? (first expresion) 'expt))
      (if (and (equal? (second expresion) variable) (number? (third expresion)))
        `(/ (expt ,variable ,(+ (third expresion) 1)) ,(+ (third expresion) 1))
        (display "La expresion no es la variable a integrar elevada a una potencia")
      )
      (display "La expresion no es la variable a integrar elevada a una potencia")
    )
)

; Integral de una constante por una variable -> '(* 5 x) retorna '(/ (* 5 (expt x 2)) 2)
(define (integral-cte-var variable expresion)
  (if (and (list? expresion) (equal? (first expresion) '*))
    (if (number? (second expresion))
      (if (equal? (third expresion) variable)
        `(/ (* ,(second expresion) (expt ,variable 2)) 2)
        (display "La expresion no es una constante por la variable a integrar")
      )
      (display "La expresion no es una constante por la variable a integrar")
    )
    (display "La expresion no es una constante por la variable a integrar")
  )
)

; Integral de una constante por una variable elevada a una potencia -> '(* 5 (expt x 2)) retorna '(/ (* 5 (expt x 3)) 3)
(define (integral-cte-pot variable expresion)
  (if (and (list? expresion) (equal? (first expresion) '*))
    (if (number? (second expresion))
      (if (and (equal? (first (third expresion)) 'expt) (equal? (second (third expresion)) variable) (number? (third (third expresion))))
        `(/ (* ,(second expresion) (expt ,variable ,(+ (third (third expresion)) 1))) ,(+ (third (third expresion)) 1))
        (display "La expresion no es una constante por la variable a integrar elevada a una potencia")
      )
      (display "La expresion no es una constante por la variable a integrar elevada a una potencia")
    ) 
    (display "La expresion no es una constante por la variable a integrar elevada a una potencia")
  )
)

#| FUNCION QUE CALCULA LA INTEGRAL DE CUALQUIER EXPRESION |#

(define (integrar variable expresion)
  (cond
    ; Integral de una constante numerica K -> 5 retorna '(* 5 x)
    ((number? expresion) (integral-cte variable expresion))
    ; Integral de una variable -> 'x retorna '(/ (expt x 2) 2)
    ((equal? variable expresion) (integral-var variable expresion))
    ; Integrales recibidas como listas
    ((list? expresion)
      (let 
        ; Declaracion de variables de la expresion
        (
          (op (first expresion)) ; Operador de la expresion
          (exp1 (second expresion)) ; Primer elemento de la expresion
          (exp2 (third expresion)) ; Segundo elemento de la expresion
        )
        (cond
          ; Integral de una variable elevada a una potencia -> '(expt x 2) retorna '(/ (expt x 3) 3)
          ((equal? op 'expt) (integral-pot variable expresion))
          ; Integrales que reciben como primer elemento una multiplicacion
          ((and (equal? op '*) (number? exp1)) 
            (cond
              ; Integral de una constante por una variable -> '(* 5 x) retorna '(/ (* 5 (expt x 2)) 2)
              ((equal? (third expresion) variable) (integral-cte-var variable expresion))
              ; Integral de una constante por una variable elevada a una potencia -> '(* 5 (expt x 2)) retorna '(/ (* 5 (expt x 3)) 3)
              (
                (and 
                  (equal? (first exp2) 'expt) 
                  (equal? (second exp2) variable)
                  (number? (third exp2))
                ) 
                (integral-cte-pot variable expresion)
              )
              (else (error "La expresion a integrar no es válida"))
            )
          )
          ; Integral de una suma de funciones -> '(+ (* 5 x) (* 2 (expt x 2))) retorna '(+ (* 5 x) (/ (expt x 3) 3))
          ((equal? op '+) `(+ ,(integrar variable exp1) ,(integrar variable exp2)))
          ; Integral de una resta de funciones -> '(- (* 5 x) (* 2 (expt x 2))) retorna '(- (* 5 x) (/ (expt x 3) 3))
          ((equal? op '-) `(- ,(integrar variable exp1) ,(integrar variable exp2)))
          (else (error "La expresion a integrar no es válida"))
        )
      )
    )
    (else (error "La expresion a integrar no es válida"))
  )
)

#| FUNCION PARA EVALUAR UNA EXPRESION DE UNA VARIABLE EN UN VALOR |#
(define (evaluar-variable expresion value)
  (eval (list 'let (list (list 'x value)) expresion))
)

#| FUNCION PARA CALCULAR Y EVALUAR EL ÁREA BAJO LA CURVA |#
(define (area-bajo-la-curva expresion lim-inf lim-sup)
  (if (and (number? lim-inf) (number? lim-sup))
    (if (<= lim-inf lim-sup)
      (let*
          (
            (variable 'x) ; Variable a integrar
            (integral (integrar variable expresion)) ; Integral de la expresion
            (integral-lim-inf (evaluar-variable integral lim-inf)) ; Integral evaluada en el limite inferior
            (integral-lim-sup (evaluar-variable integral lim-sup)) ; Integral evaluada en el limite superior
          )
          ; Retornar el valor de la integral y el area bajo la curva
          (values 
            integral
            (exact->inexact (- integral-lim-sup integral-lim-inf))
          )
      )
      (error "El limite inferior es mayor que el limite superior")
    ) 
  
    (error "Los limites de integracion no son numeros")
  )
)