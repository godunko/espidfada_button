--
--  Copyright (C) 2026, Vadim Godunko
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

package ESPIDF.Button is

   type button_config_t is limited private;

private

   sizeof_button_config_t : constant int
   with
     Import,
     Convention    => C,
     External_Name => "__ada_SIZEOF_button_config_t";

   type button_config_t is new C_Object_Storage (1 .. sizeof_button_config_t)
   with Convention => C, Default_Component_Value => 0;

end ESPIDF.Button;
