//
//  Copyright (C) 2026, Vadim Godunko
//
//  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//

#include "button_gpio.h"
#include "iot_button.h"
#include "private/espidfada_constants.h"

ESPIDFADA_SIZEOF(button_config_t, button_config_t);
ESPIDFADA_ALIGNOF(button_config_t, button_config_t);
ESPIDFADA_SIZEOF(button_event_args_t, button_event_args_t);
ESPIDFADA_ALIGNOF(button_event_args_t, button_event_args_t);
ESPIDFADA_SIZEOF(button_gpio_config_t, button_gpio_config_t);
ESPIDFADA_ALIGNOF(button_gpio_config_t, button_gpio_config_t);
