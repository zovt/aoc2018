#lang racket
(require "util.rkt")

(define seen (mutable-set))
(define sum 0)
(for (
    [el (inf-list-stream (read-all-data-from-port))]
    #:break (if (set-member? seen (+ sum el)) 
      (begin
        (println (+ sum el))
        #t)
      #f)
  )
  (set! sum (+ sum el))
  (set-add! seen sum))