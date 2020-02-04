#!/bin/sh
# Post processing script
#Delete some generated classes

cd generated_wrapper/eiffel/
rm libusb_version_struct_api.e
rm timeval_struct_api.e

cd ..
cd ..

cd generated_wrapper/c/src/
finish_freezing -library
