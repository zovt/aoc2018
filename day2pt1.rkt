#lang racket
(require "util.rkt")

;; Finds the number of times each letter in the string occurs in the string
;; String -> Set Natural
(define (occurrences str)
  (define chars (string->list str))
  (define unique-chars (set->list (list->set chars)))
  (list->set (map (lambda (el) (count (lambda (other) (eq? el other)) chars)) unique-chars)))

(define strings (map symbol->string (read-all-data-from-port)))
(define all-occurrences (map occurrences strings))
(define 2occs (count (lambda (el) (set-member? el 2)) all-occurrences))
(define 3occs (count (lambda (el) (set-member? el 3)) all-occurrences))
(* 2occs 3occs)
