#!/bin/sh
# Post processing script
#Delete some generated classes

cd generated_wrapper/eiffel/
rm LIBUSB_VERSION_STRUCT_API.e

cd ..
cd ..

cd generated_wrapper/c/src/
finish_freezing -library
