class EmptyBufferException extends Exception {}
class FullBufferException extends Exception {}

class CircularBuffer {

    public Integer head = 0
    public Integer tail = 0
    public Integer items = 0
    public Integer maxitems = capacity
    public buf = new Integer[capacity]

    CircularBuffer(int capacity) {
    }

    def clear() {
        this.items = 0
        this.head = 0
        this.tail = 0
    }

    def read() {
        if (this.items == 0) {
            throw new EmptyBufferException()
        }
        def retval = this.buf[this.tail]
        this.tail += 1
        if (this.tail >= this.maxitems) {
            this.tail -= this.maxitems
        }
        this.items -= 1
        return retval
    }

    def write(int item) {
        if (this.items == this.maxitems) {
            throw new FullBufferException()
        } 
        this.buf[this.head] = item
        this.head += 1
        if (this.head >= this.maxitems) {
            this.head -= this.maxitems
        }
        this.items += 1
    }

    def overwrite(int item) {
        if (this.items >= this.maxitems) {
            this.buf[this.tail] = item
            this.tail += 1
            if (this.tail >= this.maxitems) {
                this.tail -= this.maxitems
            }
        } else {
            this.write(item)
        }
    }
}
