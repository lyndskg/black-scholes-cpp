﻿#include<fast_io.h>

using namespace fast_io::io;

int main()
{
	using namespace fast_io::mnp;
	std::size_t a,b;
	scan(hex_get(a),hex_get(b));
	println(hex(a+b)," ",hexupper(a+b));
}
