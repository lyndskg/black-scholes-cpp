﻿#include<fast_io.h>
#include<fast_io_device.h>

using namespace fast_io::io;

int main()
{
	fast_io::obuf_file obf("a.txt");
	println(status(obf.handle));
}