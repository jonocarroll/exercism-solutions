#ifndef CIRCULAR_BUFFER_H
#define CIRCULAR_BUFFER_H

typedef int buffer_value_t;
typedef struct {
  unsigned int capacity;
  unsigned int head;
  unsigned int tail;
  unsigned int items;
  buffer_value_t* values;
} circular_buffer_t;
circular_buffer_t* new_circular_buffer(unsigned int capacity);
void clear_buffer(circular_buffer_t* buffer);
void delete_buffer(circular_buffer_t* buffer);
unsigned int write(circular_buffer_t* buffer, buffer_value_t value);
unsigned int overwrite(circular_buffer_t* buffer, buffer_value_t value);
unsigned int read(circular_buffer_t* buffer, buffer_value_t* value);

#endif
