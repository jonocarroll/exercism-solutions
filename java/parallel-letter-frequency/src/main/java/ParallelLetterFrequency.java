import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
<<<<<<< HEAD
=======
//import java.util.concurrent.atomic.AtomicInteger;
>>>>>>> 4d50dbcf694e4dcc11fd36ec5decc04c7a3cb9be

class ParallelLetterFrequency {

    private final String[] texts;

    ParallelLetterFrequency(String[] texts) {
        this.texts = texts;
    }

    Map<Character, Integer> countLetters() {
        Map<Character, Integer> letterCount = new ConcurrentHashMap<>();
<<<<<<< HEAD
=======
        // AtomicInteger nextIndex = new AtomicInteger(0);
>>>>>>> 4d50dbcf694e4dcc11fd36ec5decc04c7a3cb9be
        int numThreads = texts.length;
        Thread[] threads = new Thread[numThreads];

        for (int i = 0; i < numThreads; i++) {
            String str = texts[i];
            threads[i] = new Thread(() -> countLettersThreaded(str, letterCount));
            threads[i].start();
        }

        for (Thread thread : threads) {
            try {
                thread.join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

        return letterCount;
    }

    Map<Character, Integer> countLettersThreaded(String str, Map<Character, Integer> letterCount) {
        str = str.toLowerCase();
        for (char c : str.toCharArray()) {
            if (Character.isLetter(c)) {
                letterCount.merge(c, 1, Integer::sum);
            }
        }

        return letterCount;
    }
}
