#include<string>
#include<fast_io.h>
#include<fast_io_device.h>
#include<fast_io_driver/timer.h>
using namespace fast_io::io;

int main()
{
	constexpr std::size_t N(1000000);
	{
		fast_io::timer t(u8"output");
		fast_io::u32outf8_file obf(u8"u32utf8_file.txt");
		for(std::size_t i{};i!=N;++i)
		{
			print(obf,U"😀😃😄😁😆😅🤣😂🙂🙃\n");
		}
	}
	std::u32string buffer;
	{
		fast_io::timer t(u8"input");
		fast_io::u32iutf8_file ibf(u8"u32utf8_file.txt");
		for(std::size_t i{};i!=N;++i)
		{
			scan(ibf,buffer);
		}
	}
}