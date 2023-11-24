#lang racket

#| CONDICIONAL IF |#

; 1) Un simple if.
(define (pruebaif)
  (if 5
    7
    3
  )
)

; 2) Escribir una función que nos indique si el valor que recibe es positivo o negativo.
(define (signoDeX x)
  (if (positive? x)
    (display "El número es positivo")
    (display "El número es negativo")
  )
)

;2.1) Escribir una función que nos indique si el valor que recibe es positivo, negativo o cero.

(define (signoDeX2 x)
  (if (positive? x)
    (display "El número es positivo")
    (if (negative? x)
      (display "El número es negativo")
      (display "El número es cero")
    )
  )
)

; 3) Escriba una función que indique si la suma de dos números es mayor o menor que 10.
(define (compararCon10 a b)
  (if (> (+ a b) 10)
    (display "La suma es mayor que 10")
    (display "La suma es menor que 10")
  )
)

; 4) Escriba una función que indique si la suma de dos números es mayor, menor o igual a 10.
(define (comparar-suma a b)
  (if (> (+ a b) 10)
    (display "La suma es mayor que 10")
      (if(< (+ a b) 10)
        (display "La suma es menor que 10")
        (display "La suma es igual a 10")
      )
  )
)

; 4.1) Mas de una instruccion en el if.
(define (comparar-suma2 a b)
  (if(< (+ a b) 10)
    (begin
      (display "La suma ")
      (display "es menor que 10")
    )
    (begin
      (display "La suma ")
      (display "es mayor que 10")
    )
  )
)

#| CONDICIONAL COND |#

; 1) Escriba una función que indique si la suma de dos números es mayor, menor o igual a 10.

(define (comparacionCon10 a b)
  (cond
    ((< (+ a b) 10) (display "La suma es menor que diez"))
    ((> (+ a b) 10) (display "La suma es mayor que diez"))
    (else (display "La suma es igual a diez"))
  )
)

; 2) Escriba una función Racket que reciba un entero que represente un día de la semana e imprima un mensaje de texto indicando el día a que corresponde.
(define (diaSemana dia)
  (cond
    ((= dia 1) (display "El día es lunes"))
    ((= dia 2) (display "El día es martes"))
    ((= dia 3) (display "El día es miércoles"))
    ((= dia 4) (display "El día es jueves"))
    ((= dia 5) (display "El día es viernes"))
    ((= dia 6) (display "El día es sábado"))
    ((= dia 7) (display "El día es domingo"))
    (else (display "Número de día no válido"))
  )
)

#| CONDICIONAL CASE |#

; 1) Elabore una función, tipo menú, que valide una opción que recibe por medio de su argumento. Los valores que la opción puede tomar van del 1 al 3. Si el valor recibido es distinto, desplegar un mensaje indicándolo.
(define (ejemploCase1 n)
  (case n
    ((1) (display "Se pulsó la opción 1"))
    ((2) (display "Se pulsó la opción 2"))
    ((3) (display "Se pulsó la opción 3"))
    (else (display "Opción no válida"))
  )
)

; 2) Modifique la función anterior para que despliegue mensajes: “Se pulsó la opción #” donde # se imprime en una segunda instrucción display.
(define (ejemploCase2 n)
  (case n
    ((1) (display "Se pulsó la opción ") (display n))
    ((2) (display "Se pulsó la opción ") (display n))
    ((3) (display "Se pulsó la opción ") (display n))
    (else (display "Opción no válida"))
  )
)

; EJEMPLO

; 1) Escriba un programa Racket que lea una opción desde teclado e indique la opción elegida. Si el valor introducido no corresponde con ninguna opción, despliegue un mensaje indicándolo. Las opciones son de la 1 a la 3.
(define (leerValor)
  (read)
)

(define (ejemploCase3 n)
  (case n
    ((1) (display "Se pulsó la opción ") (display n))
    ((2) (display "Se pulsó la opción ") (display n))
    ((3) (display "Se pulsó la opción ") (display n))

    (else (display "Opción no válida"))
  )
)

#| Callbacks |#

(define (hacer-funcion funcion x)
  (funcion x)
)

(define (sumar10 x)
  (+ x 10)
)

; > (hacer-funcion sumar10 5)

#| FUNCIONES LAMBDA |#

; 1) Escriba una función que reciba un número y le sume 10.

(hacer-funcion (lambda (x) (+ x 10)) 5)

; 4) La siguiente función lambda muestra cómo se reciben dos argumentos. El resultado devuelto es la suma de ambos.

(define (hacer-función2 función x y)
  (función x y)
)

(hacer-función2 (lambda(x y) (+ x y)) 5 7.3)