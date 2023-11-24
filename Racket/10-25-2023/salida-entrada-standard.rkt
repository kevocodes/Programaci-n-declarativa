#lang racket

#| ESCRITURA DE DATOS |#

; Desplegar un mensaje en pantalla:
(define (desplegarMensaje)
  (display "Hola, este es mi primer mensaje")
)

; Recibiendo parametros
(define (desplegarMensajePropio mensaje)
  (display mensaje)
)

; Realización de varios despliegues en pantalla:
(define (desplegarVarios)
  (displayln "Primer mensaje\n")
  (display "Nueva línea de mensaje")
)

#| LECTURA DE DATOS |#

; Desde la línea de comando, al invocar una función:
(define (duplicar-valor-leido n)
  (* 2 n)
)
; (duplicar-valor-leido (read))


; Una función que solo realiza lectura:
(define (leerValor)
  (read)
)

(define (mostrarValorLeido a)
  (display "El valor leído es: ")
  (display a)
)
