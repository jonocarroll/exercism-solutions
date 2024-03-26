package letter

// FreqMap records the frequency of each rune in a given text.
type FreqMap map[rune]int

// Frequency counts the frequency of each rune in a given text and returns this
// data as a FreqMap.
func Frequency(text string) FreqMap {
	frequencies := FreqMap{}
	for _, r := range text {
		frequencies[r]++
	}
	return frequencies
}

func FreqChan(text string, c chan FreqMap) {
	frequencies := FreqMap{}
	for _, r := range text {
		frequencies[r]++
	}
	c <- frequencies
}

func mergeMaps(m1, m2 map[rune]int) map[rune]int {
	merged := make(map[rune]int)

	// Add all keys and values from m1
	for k, v := range m1 {
		merged[k] = v
	}

	// Add values from m2, overwriting values from m1 if keys overlap
	for k, v := range m2 {
		merged[k] += v
	}

	return merged
}

// ConcurrentFrequency counts the frequency of each rune in the given strings,
// by making use of concurrency.
func ConcurrentFrequency(texts []string) FreqMap {
	nChunks := len(texts)
	c := make(chan FreqMap)
	for i := 0; i < nChunks; i++ {
		go FreqChan(texts[i], c)
	}
	res := make(FreqMap)
	for i := 0; i < nChunks; i++ {
		res = mergeMaps(res, <-c)
	}
	return res
}
