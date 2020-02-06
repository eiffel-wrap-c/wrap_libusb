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

Download the latest windows binaries https://github.com/libusb/libusb/releases/download/v1.0.23/libusb-1.0.23.7z
Copy the library `libusb-1.0.lib` to `library\C\lib`
		
To learn more check the libusb wiki pages 

* https://github.com/libusb/libusb/wiki
* https://github.com/libusb/libusb/wiki/Windows

## Status

Work in progress


## Examples

* [testlibusb](examples/testlibusb)  `Test suite program based of C's libusb-0.1-compat testlibusb example.`
* [listdevs](examples/listdevs)      `libusb example program to list devices on the bus.`

