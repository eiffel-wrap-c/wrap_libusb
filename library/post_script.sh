#!/bin/sh
# Post processing script
#Delete some generated classes
cp ewg_libusb_callback_c_glue_code.c  ./generated_wrapper/c/src
cp Makefile.SH ./generated_wrapper/c/src 

cd generated_wrapper/eiffel/
rm libusb_version_struct_api.e
rm timeval_struct_api.e
rm libusb_config_descriptor_struct_api.e
rm libusb_interface_descriptor_struct_api.e
rm libusb_interface_struct_api.e
rm libusb_bos_descriptor_struct_api.e
cd ..
cd ..

cd generated_wrapper/c/src/
finish_freezing -library
