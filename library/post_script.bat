@echo on
title post_process script
cp ewg_libusb_callback_c_glue_code.c  ./generated_wrapper/c/src

cd generated_wrapper/eiffel/
del /f libusb_version_struct_api.e
del /f timeval_struct_api.e
del /f libusb_config_descriptor_struct_api.e
del /f libusb_interface_descriptor_struct_api.e
del /f libusb_interface_struct_api.e
del /f libusb_bos_descriptor_struct_api.e

cd ..
cd ..

cd generated_wrapper/c/src/
finish_freezing -library
