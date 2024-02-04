(ns interest-is-interesting)

(defn interest-rate
  "TODO: add docstring"
  [balance]
  (cond (< balance 0) -3.213
        (< balance 1000) 0.5
        (< balance 5000) 1.621
        (>= balance 5000) 2.475
        )
  )

(defn annual-balance-update
  "TODO: add docstring"
  [balance]
  (bigdec (cond (< balance 0) (- balance (* (/ (bigdec (interest-rate balance)) 100.0M) balance))
        :else (+ (* (/ (bigdec (interest-rate balance)) 100.0M) balance) balance)
        ))
  )

(defn amount-to-donate
  "TODO: add docstring"
  [balance tax-free-percentage]
  (cond (pos? (annual-balance-update balance)) (int (Math/floor (* (/ (* tax-free-percentage balance) 100) 2)))
        :else 0)
  )
