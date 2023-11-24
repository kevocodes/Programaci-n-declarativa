#lang racket

; Cadenas y caracteres

;Ejercicios

;1) Eliminar el carácter de una posición determinada en una cadena. La función debe retornar tres resultados: la subcadena de la izquierda, la subcadena de la derecha y la cadena resultante.

; 1.1) Haciendo uso de identificadores y desplegando:
(define (borrarCar01 cad pos)
  (let*
      (
       (subCad1 (substring cad 0 pos))
       (subCad2 (substring cad (+ pos 1) (string-length cad)))
       (subCad3 (string-append subCad1 subCad2))
       )
    (displayln subCad1)
    (displayln subCad2)
    (displayln subCad3)
    )
  )

; 1.2) Sin identificadores y retornando los tres valores:
(define (borrarCar02 cad pos)
  (values
   (substring cad 0 pos)
   (substring cad (add1 pos) (string-length cad))
   (string-append (substring cad 0 pos) (substring cad (add1 pos) (string-length cad)))
   )
  )

; 2) Desplegar uno a uno todos los caracteres de una cadena

; Haciendo uso de declaración de identificadores:
(define (muestraCars01 cad)
  (mostrarCars01 cad 0)
)

(define (mostrarCars01 cad i)
  (if (< i (string-length cad))
    (begin
      (let*
        (
          (car (string-ref cad i))
        )
        (displayln car)
        (mostrarCars01 cad (add1 i))
      )
    )
    (newline)
  )
)

; Sin declaración de identificadores:
(define (muestraCars02 cad)
  (mostrarCars02 cad 0 (string-length cad))
)

(define (mostrarCars02 cad i n)
  (if (< i n)
    (begin
      (displayln (string-ref cad i))
      (mostrarCars02 cad (add1 i) n)
    )
    (newline)
  )
)

; 3) Contar cuantas veces se repite determinado carácter en una cadena.
(define (contarOcurCar cad car)
  (contOcurCar cad 0 car 0)
)

(define (contOcurCar cad i car cont)
  (cond
    ((equal? i (string-length cad)) cont)
    ((not (char=? (string-ref cad i) car)) (contOcurCar cad (add1 i) car cont))
    ((char=? (string-ref cad i) car) (contOcurCar cad (add1 i) car (add1
    cont)))
  )
)

; 4) Eliminar, de una cadena, todas las ocurrencias de un determinado carácter.

