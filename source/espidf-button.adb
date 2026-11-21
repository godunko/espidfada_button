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

   ----------------------------
   -- iot_button_register_cb --
   ----------------------------

   procedure iot_button_register_cb
     (btn_handle : in out button_dev_t;
      event      : button_event_t;
      event_args : in out button_event_args_t;
      cb         : button_cb_t;
      usr_data   : System.Address := System.Null_Address) is
   begin
      ESPIDF.Ada_ESP_Check_Error
        (iot_button_register_cb (btn_handle, event, event_args, cb, usr_data));
   end iot_button_register_cb;

end ESPIDF.Button;