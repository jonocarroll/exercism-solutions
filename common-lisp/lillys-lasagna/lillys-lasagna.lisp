(defpackage :lillys-lasagna
  (:use :cl)
  (:export :expected-time-in-oven
           :remaining-minutes-in-oven
           :preparation-time-in-minutes
           :elapsed-time-in-minutes))

(in-package :lillys-lasagna)

;; Define function expected-time-in-oven
(defun expected-time-in-oven () "expected time in oven"
  337
)

;; Define function remaining-minutes-in-oven
(defun remaining-minutes-in-oven (time) "remaining time in oven"
  (- (expected-time-in-oven) time)
)

;; Define function preparation-time-in-minutes
(defun preparation-time-in-minutes (layers) "prep time, 19 minutes per layer"
  (* layers 19)
)

;; Define function elapsed-time-in-minutes
(defun elapsed-time-in-minutes (layers minutes) "total time for prep and oven"
  (+ (preparation-time-in-minutes layers) minutes)
)
