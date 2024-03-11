class EmptyBufferException() extends Exception {}

class FullBufferException() extends Exception {}

class CircularBuffer(var capacity: Int) {

  var head = 0
  var tail = 0
  var items = 0
  var buf = new Array[Int](capacity)

  def write(value: Int) = {
      if (this.items == capacity) {
         throw new FullBufferException()
      } else {
         buf(head) = value
         this.head += 1
         if (this.head >= capacity) {
             this.head -= capacity
         }
         this.items += 1
      }
  }

  def read(): Int = {
      if (this.items == 0) {
          throw new EmptyBufferException()
      } else {
          var retval = buf(this.tail)
          this.tail += 1
          if (this.tail >= capacity) {
             this.tail -= capacity
          }
          this.items -= 1
          retval
      }
  }

  def overwrite(value: Int) = {
      if (this.items >= capacity) {
          buf(tail) = value
          this.tail += 1
          if (this.tail >= capacity) {
             this.tail -= capacity
          }
      } else {
        this.write(value)
      }

  }

  def clear() = {
      this.items = 0
      this.head = 0
      this.tail = 0
  }
}