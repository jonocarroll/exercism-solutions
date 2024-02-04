(defpackage :pizza-pi
  (:use :cl)
  (:export :dough-calculator :pizzas-per-cube
           :size-from-sauce :fair-share-p))

(in-package :pizza-pi)

(defun dough-calculator (pizzas diameter)
  ;; g = n * (((45 * pi * d) / 20) + 200)
  (round (* pizzas (+ (/ (* 45 pi diameter) 20) 200)))
)

(defun size-from-sauce (sauce)
  ;; d = square-root of ((40 * s) / (3 * pi))
  (sqrt (/ (* 40 sauce) (* 3 pi)))
)

(defun pizzas-per-cube (cube-size diameter)
  ;; n = (2 * (l^3))/(3 * pi * (d^2))
  (floor (* 2 (/ (expt cube-size 3) (* 3 pi (expt diameter 2)))))
)

(defun fair-share-p (pizzas friends)
  (= (mod (* pizzas 8) friends) 0)
)
