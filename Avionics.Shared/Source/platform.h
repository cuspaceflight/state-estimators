#ifndef PLATFORM_H
#define PLATFORM_H
#include <stdint.h>

// This file contains declarations which are to be defined elsewhere

uint32_t platform_get_counter_value(void);

void platform_set_counter_value(uint32_t value);

uint32_t platform_get_counter_frequency(void);

#endif /*PLATFORM_H*/