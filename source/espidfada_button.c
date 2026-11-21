//
//  Copyright (C) 2026, Vadim Godunko
//
//  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//

#include "button_gpio.h"
#include "iot_button.h"

int __ada_SIZEOF_button_config_t = sizeof(button_config_t);
int __ada_SIZEOF_button_event_args_t = sizeof(button_event_args_t);
int __ada_SIZEOF_button_gpio_config_t = sizeof(button_gpio_config_t);

void __ada_SET_button_gpio_config_t_gpio_num(button_gpio_config_t *self, gpio_num_t to)
{
    self->gpio_num = to;
}

void __ada_SET_button_gpio_config_t_active_level(button_gpio_config_t *self, uint8_t to)
{
    self->active_level = to;
}