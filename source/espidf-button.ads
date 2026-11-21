--
--  Copyright (C) 2026, Vadim Godunko
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

with ESPIDF.Driver.GPIO;

package ESPIDF.Button is

   type button_event_t is
     (BUTTON_PRESS_DOWN,
      BUTTON_PRESS_UP,
      BUTTON_PRESS_REPEAT,
      BUTTON_PRESS_REPEAT_DONE,
      BUTTON_SINGLE_CLICK,
      BUTTON_DOUBLE_CLICK,
      BUTTON_MULTIPLE_CLICK,
      BUTTON_LONG_PRESS_START,
      BUTTON_LONG_PRESS_HOLD,
      BUTTON_LONG_PRESS_UP,
      BUTTON_PRESS_END,
      BUTTON_EVENT_MAX,
      BUTTON_NONE_PRESS)
   with Convention => C;

   type button_config_t is limited private;

   type button_gpio_config_t is limited private;

   procedure Set_gpio_num
     (Self : in out button_gpio_config_t; To : ESPIDF.Driver.GPIO.gpio_num_t)
   with
     Import,
     Convention    => C,
     External_Name => "__ada_SET_button_gpio_config_t_gpio_num";

   procedure Set_active_level
     (Self : in out button_gpio_config_t; To : uint8_t)
   with
     Import,
     Convention    => C,
     External_Name => "__ada_SET_button_gpio_config_t_active_level";

   type button_dev_t is limited private;

   type button_handle_t is access all button_dev_t with Convention => C;

   function iot_button_new_gpio_device
     (button_config : in button_config_t;
      gpio_config   : in button_gpio_config_t;
      ret_button    : out button_handle_t) return ESPIDF.esp_err_t
   with Import, Convention => C, External_Name => "iot_button_new_gpio_device";

   procedure iot_button_new_gpio_device
     (button_config : in button_config_t;
      gpio_config   : in button_gpio_config_t;
      ret_button    : out button_handle_t);

private

   sizeof_button_config_t : constant int
   with
     Import,
     Convention    => C,
     External_Name => "__ada_SIZEOF_button_config_t";

   type button_config_t is new C_Object_Storage (1 .. sizeof_button_config_t)
   with Convention => C, Default_Component_Value => 0;

   sizeof_button_gpio_config_t : constant int
   with
     Import,
     Convention    => C,
     External_Name => "__ada_SIZEOF_button_gpio_config_t";

   type button_gpio_config_t is
     new C_Object_Storage (1 .. sizeof_button_gpio_config_t)
   with Convention => C, Default_Component_Value => 0;

   type button_dev_t is null record with Convention => C;

end ESPIDF.Button;
