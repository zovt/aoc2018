#lang racket
(require "util.rkt")

(let ([vals (read-all-data-from-port)])
  (println (foldl + 0 vals)))

