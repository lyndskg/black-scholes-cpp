﻿#include<string>
#include<atlstr.h>
#include<fast_io_driver/mfc.h>
#include<fast_io.h>

using namespace fast_io::io;

int main()
{
	CString cstr(fast_io::concat_atl_cstring("wwadqwjdqwjopdqjdpoqwjdpqowdjqwpodjwqop ",241.42315235," asfaf"));
	print(cstr);
}
