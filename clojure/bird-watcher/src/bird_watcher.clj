(ns bird-watcher)

(def last-week [0 2 5 3 7 8 4])

(defn today [birds]
  (last birds)
)

(defn inc-bird [birds]
  (assoc birds (- (count birds) 1) (+ (today birds) 1))
)

(defn day-without-birds? [birds]
  (not= -1 (.indexOf birds 0))
)

(defn n-days-count [birds n]
  (reduce + (subvec birds 0 n))
)

(defn busy-days [birds]
  (count (filter #(> % 4) birds))
)

(defn odd-week? [birds]
  (= birds [1 0 1 0 1 0 1])
)
