@echo on
title post_process script
cd generated_wrapper/eiffel/
del /f libusb_version_struct_api.e
del /f timeval_struct_api.e
del libusb_config_descriptor_struct_api
del libusb_interface_descriptor_struct_api
del libusb_interface_struct_api

cd ..
cd ..

cd generated_wrapper/c/src/
finish_freezing -library
