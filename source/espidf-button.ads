--
--  Copyright (C) 2026, Vadim Godunko
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

with System;

with ESPIDF.Driver.GPIO;

private with ESPIDF.Constants.Button;

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

   type button_event_args_t is limited private;

   type button_dev_t is limited private;

   type button_handle_t is access all button_dev_t with Convention => C;

   type button_cb_t is
     access procedure
       (button_handle : in out button_dev_t; usr_data : System.Address)
   with Convention => C;

   function iot_button_new_gpio_device
     (button_config : button_config_t;
      gpio_config   : button_gpio_config_t;
      ret_button    : out button_handle_t) return ESPIDF.esp_err_t
   with Import, Convention => C, External_Name => "iot_button_new_gpio_device";

   procedure iot_button_new_gpio_device
     (button_config : button_config_t;
      gpio_config   : button_gpio_config_t;
      ret_button    : out button_handle_t);

   function iot_button_register_cb
     (btn_handle : in out button_dev_t;
      event      : button_event_t;
      event_args : in out button_event_args_t;
      cb         : button_cb_t;
      usr_data   : System.Address := System.Null_Address)
      return ESPIDF.esp_err_t
   with Import, Convention => C, External_Name => "iot_button_register_cb";

   procedure iot_button_register_cb
     (btn_handle : in out button_dev_t;
      event      : button_event_t;
      event_args : in out button_event_args_t;
      cb         : button_cb_t;
      usr_data   : System.Address := System.Null_Address);

private

   type button_config_t is
     new C_Object_Storage (1 .. ESPIDF.Constants.Button.sizeof_button_config_t)
   with
     Convention              => C,
     Alignment               =>
       ESPIDF.Constants.Button.alignof_button_config_t,
     Default_Component_Value => 0;

   type button_gpio_config_t is
     new C_Object_Storage
          (1 .. ESPIDF.Constants.Button.sizeof_button_gpio_config_t)
   with
     Convention              => C,
     Alignment               =>
       ESPIDF.Constants.Button.alignof_button_gpio_config_t,
     Default_Component_Value => 0;

   type button_dev_t is limited null record with Convention => C;

   type button_event_args_t is
     new C_Object_Storage
          (1 .. ESPIDF.Constants.Button.sizeof_button_event_args_t)
   with
     Convention              => C,
     Alignment               =>
       ESPIDF.Constants.Button.alignof_button_event_args_t,
     Default_Component_Value => 0;

end ESPIDF.Button;
