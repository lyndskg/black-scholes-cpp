﻿#include<fast_io.h>

using namespace fast_io::io;

int main()
{
	print(fast_io::out(),"Hello World\n");
}
/*
This outputs to file descriptor 1 on non-windows systems. STDOUT_HANDLE on windows or Wine or ReactOS.
*/