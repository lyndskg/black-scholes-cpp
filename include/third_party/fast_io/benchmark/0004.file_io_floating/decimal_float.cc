﻿#include<fast_io.h>
#include<random>
#include<cfloat>
#include<fast_io_device.h>
#include<fast_io_driver/timer.h>
using namespace fast_io::io;

int main()
{
	constexpr std::size_t N{10000000};
	std::mt19937_64 eng{};
	std::uniform_real_distribution<float> dis(FLT_MIN,FLT_MAX);
	std::vector<float> vec;
	vec.reserve(N);
	for(std::size_t i{};i!=N;++i)
	{
		vec.emplace_back(dis(eng));
	}
	{
		fast_io::timer t(u8"decimal float");
		fast_io::u8obuf_file file(u8"decimal_float.txt");
		for(auto const & e : vec)
		{
			println(file,e);
		}
	}
}
