
#lang racket 

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