idf_component_register(SRCS source/espidfada_button.c
    PRIV_REQUIRES espressif__button espidfada)

idf_component_get_property(espidfada_dir espidfada COMPONENT_DIR)
include("${espidfada_dir}/cmake/constants.cmake")
espidfada_generate_constants(NAME Button SOURCE "tools/button_constants.c")
