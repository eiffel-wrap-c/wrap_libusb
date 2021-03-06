# wrap_libusb
`wrap_libusb` is an Eiffel binding of [libusb C API](https://libusb.info/) 
using [WrapC](https://github.com/eiffel-wrap-c/WrapC) tool.

## Requirements 


*  [WrapC](https://github.com/eiffel-wrap-c/WrapC) tool.
*  [libusb C API](https://libusb.info/).

## Download and  Install

### Linux

Download the source package: https://github.com/libusb/libusb/releases/download/v1.0.23/libusb-1.0.23.tar.bz2

To build and install libusb, run

	$ ./configure
	$ make
	# make install

Then add the package libusb to pkg-config search path

	pkg-config --cflags --libs /usr/local/lib/pkgconfig/libusb-1.0.pc

Check	
	
	pkg-config --cflags --libs libusb-1.0

you should see something like
	
	-I/usr/local/include/libusb-1.0 -L/usr/local/lib -lusb-1.0

### Windows
Using vcpkg (https://github.com/microsoft/vcpkg) tool, you can install libusb library

```
	vcpkg install libusb:x64-windows-static
```

Copy the library `libusb-1.0.lib` to `library\C\lib`
If you are using Windows, it's recommended first read the libusb wiki
https://github.com/libusb/libusb/wiki/Windows.

		
To learn more check the libusb wiki pages 

* https://github.com/libusb/libusb/wiki

## Status

Work in progress


## Examples

* [testlibusb](examples/testlibusb)       `Test suite program based of C's libusb-0.1-compat testlibusb example.`
* [listdevs](examples/listdevs)      	  `libusb example program to list devices on the bus.`
* [hotplugtest](examples/hotplugtest)     `libusb example program for hotplug API.`

### How to compile the C library glue code.

Before to use the examples you will need to compile the C glue code, go to 

	`library/generated_wrapper/c/src` 

and run

	`finish_freezing --library`

It will copy the C lib `eif_libusb.a` or `eif_libusb.lib` under the library root `$ECF_CONFIG_PATH/C/spec/$(ISE_PLATFORM)/lib/`

