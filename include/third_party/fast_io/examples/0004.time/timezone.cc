#include<fast_io.h>

using namespace fast_io::io;

int main()
{
	println(fast_io::native_local_timezone{}());
}