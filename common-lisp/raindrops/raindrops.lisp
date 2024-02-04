(defpackage :raindrops
  (:use :cl)
  (:export :convert))

(in-package :raindrops)

(defvar lu (pairlis '(7 5 3) '("Plong" "Plang" "Pling")))

(defun divisible-strings (n pair)
  (if (zerop (mod n (car pair))) (cdr pair) nil)
  )

(defun iterate-string (n)
  (map 'list (lambda (pair) (divisible-strings n pair)) lu)
  )

(defun convert (n)
  "Converts a number to a string of raindrop sounds."
  (setq res (apply #'concatenate 'string (iterate-string n)))
  (if (string= res "") (write-to-string n) res)
  )
