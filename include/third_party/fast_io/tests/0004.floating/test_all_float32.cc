﻿#include<fast_io.h>
#include<fast_io_device.h>
#include<fast_io_crypto.h>
#include<fast_io_driver/timer.h>

using namespace fast_io::io;

int main()
{
	using namespace fast_io::mnp;
	fast_io::timer tm(u8"test float32 ");
	fast_io::sha256_context sha;
	{
	constexpr std::uint64_t v{UINT32_MAX};
	for(std::uint64_t i{};i<=v;++i)
	{
		std::uint32_t low32bits{static_cast<std::uint32_t>(i)};
		println(as_file(sha), fast_io::mnp::scientific(std::bit_cast<float>(low32bits)));
	}
//	flush(sha_obf);
	sha.do_final();
	}
	println("sha256=",hash_digest(sha));
}
