(ns leap)

(defn divisible? [x y]
  (zero? (mod x y))
  )

(defn leap-year? [year]
  ;; curried function
  (defn yeardivisible? [x]
    (divisible? year x)
    )

  (if (yeardivisible? 4)
    (or (not (yeardivisible? 100))
        (yeardivisible? 400))
    false)
  )
