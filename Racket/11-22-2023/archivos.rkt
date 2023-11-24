#lang racket

;--------------------
; Abrir y cerrar un archivo de inmediato:
(define (crear-archivo nombre)
  (define nombre-con-ext (string-append nombre ".txt"))
  ; nombre logico -> nombre fisico
  (define archivo (open-output-file nombre-con-ext #:mode 'text #:exists 'replace))
  (close-output-port archivo)
)
;-------------------
; Elabore una funcion que almacene en un archivo los datos que se leen desde
; teclado, uno por fila, hasta introducir cero.
(define (leer-hasta-cero)
  ; nombre logico -> nombre fisico
  (define archivo (open-output-file "datos_de_teclado.txt" #:mode 'text #:exists 'replace))
  (leer-hasta-cero-rec archivo)
  (close-output-port archivo)
)

(define (leer-hasta-cero-rec flujo)
  (local
    (
      (define dato (read))
    )
    (if (not (zero? dato))
      (begin 
        (display dato flujo)
        (newline flujo)
        (leer-hasta-cero-rec flujo)
      )
      (void)
    )
  )
)

;--------------------
; Dado un archivo de texto, lea su contenido y muestrelo en consola
(define (leer-desde-archivo)
    (define archivo (open-input-file "datos_de_teclado.txt" #:mode 'text))
    (mostrar-archivo-rec archivo)
    (close-input-port archivo)
)

(define (mostrar-archivo-rec flujo)
  (local
    (
      (define dato (read-line flujo 'any))
    )
    (if (not (eof-object? dato))
      (begin 
        (display dato)
        (newline)
        (mostrar-archivo-rec flujo)
      )
      (void)
    )
  )
)
;--------------------
; Elabore una funcion, que dada una lista de numeros enteros, almacene en un archivo los valores de una lista en una misma linea de texto.

(define (leer-lista lista)
  (define archivo (open-output-file "datos_de_teclado.txt" #:mode 'text #:exists 'replace))
  (leer-lista-rec archivo lista)
  (close-output-port archivo)
)

(define (leer-lista-rec flujo lista)
  (if (not (empty? lista))
      (local
        (
          (define dato (first lista))
        )
        (begin
          (display dato flujo)
          (display " " flujo)
          (leer-lista-rec flujo (rest lista))
        )
      )
    (void)
  )
)

;--------------------
; Elabore una funcion que, dada una lista de numeros enteros, almacene en un archivo los factoriales de dichos numeros.