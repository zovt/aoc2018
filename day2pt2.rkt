#lang racket
(require "util.rkt")

;; Counts the differing characters between both strings
;; String -> String -> Real
(define (str-diff a b)
  (define pairs (map list (string->list a) (string->list b)))
  (length (filter (lambda (p) (not (apply eq? p))) pairs)))

(define strings (map symbol->string (read-all-data-from-port)))
(define pairs (combinations strings 2))
(define 1diff (filter (lambda (p) (eq? (apply str-diff p) 1)) pairs))
(println 1diff)
