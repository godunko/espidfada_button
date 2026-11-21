--
--  Copyright (C) 2026, Vadim Godunko
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

with ESPIDF.Ada_ESP_Check_Error;

package body ESPIDF.Button is

   --------------------------------
   -- iot_button_new_gpio_device --
   --------------------------------

   procedure iot_button_new_gpio_device
     (button_config : in button_config_t;
      gpio_config   : in button_gpio_config_t;
      ret_button    : out button_handle_t) is
   begin
      ESPIDF.Ada_ESP_Check_Error
        (iot_button_new_gpio_device (button_config, gpio_config, ret_button));
   end iot_button_new_gpio_device;

end ESPIDF.Button;