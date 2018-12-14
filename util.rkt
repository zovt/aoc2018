#lang racket

;; ---------------- Provides
(provide read-all-data-from-port)
(provide inf-list-stream)

;; ---------------- Implementations
;; Port -> List
(define (read-all-data-from-port [in (current-input-port)] [acc '()])
  (let ([v (read in)])
    (if (eq? v eof)
        (reverse acc)
      (read-all-data-from-port in (cons v acc)))))

;; A stream that repeats the values in the list infinitely
(struct inf-list-stream (lst)
  #:methods gen:stream
  [
    (define (stream-empty? iter) (empty? (inf-list-stream-lst iter)))
    (define (stream-first iter) (car (inf-list-stream-lst iter)))
    (define (stream-rest iter)
      (let ([lst (inf-list-stream-lst iter)])
        (inf-list-stream (append (cdr lst) (list (car lst))))))
  ])
