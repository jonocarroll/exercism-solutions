#include "circular_buffer.h"
#include <stdlib.h>
#include <errno.h>

circular_buffer_t* new_circular_buffer(unsigned int capacity) {
  circular_buffer_t* buffer = malloc(sizeof(circular_buffer_t));
  buffer->capacity = capacity;
  buffer->values = malloc(sizeof(buffer_value_t) * capacity);
  buffer->head = 0;
  buffer->tail = 0;
  buffer->items = 0;
  return buffer;
}

unsigned int read(circular_buffer_t* buffer, buffer_value_t* value){
  if (buffer->items == 0) {
    errno = ENODATA;
    return EXIT_FAILURE;
  }
  *value = buffer->values[buffer->tail];
  buffer->tail += 1;
  if (buffer->tail >= buffer->capacity) {
    buffer->tail -= buffer->capacity;
  }
  buffer->items -= 1;
  return EXIT_SUCCESS;
}

unsigned int write(circular_buffer_t* buffer, buffer_value_t value) {
  if (buffer->items == buffer->capacity) {
    errno = ENOBUFS;
    return EXIT_FAILURE;
  }
  buffer->values[buffer->head] = value;
  buffer->head += 1;
  if (buffer->head >= buffer->capacity) {
    buffer->head -= buffer->capacity;
  }
  buffer->items += 1;
  return EXIT_SUCCESS;
}

unsigned int overwrite(circular_buffer_t* buffer, buffer_value_t value) {
  if (buffer->items >= buffer->capacity) {
    buffer->values[buffer->tail] = value;
    buffer->tail += 1;
    if (buffer->tail >= buffer->capacity) {
      buffer->tail -= buffer->capacity;
    }
  } else {
    write(buffer, value);
  }
  return EXIT_SUCCESS;
}

void clear_buffer(circular_buffer_t* buffer) {
  buffer->items = 0;
  buffer->head = 0;
  buffer->tail = 0;
}

void delete_buffer(circular_buffer_t* buffer) {
  free(buffer->values);
  free(buffer);
}
