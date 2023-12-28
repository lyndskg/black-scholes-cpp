﻿#include<string>
#include<fast_io.h>
#include<fast_io_device.h>
#include<fast_io_driver/timer.h>
#include<vector>
#include<format>
#include<locale>
using namespace fast_io::io;

int main()
{
	constexpr std::size_t N(10000000);
	{
		std::locale loc("");
	fast_io::timer t(u8"output");
	fast_io::obuf_file obf(u8"iobuf_file_std_format_locale.txt");
	for(std::size_t i{};i!=N;++i)
	{
		print(obf,std::format(loc,"{}\n",i));
	}
	}
}
