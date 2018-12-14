#lang racket
(provide read-all-data-from-port)

; Port -> List
(define (read-all-data-from-port [in (current-input-port)] [acc '()])
  (let ([v (read in)])
    (if (eq? v eof)
        (reverse acc)
      (read-all-data-from-port in (cons v acc)))))
