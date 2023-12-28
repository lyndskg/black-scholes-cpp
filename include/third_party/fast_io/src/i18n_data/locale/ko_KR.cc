﻿#include"../localedef.h"

namespace fast_io_i18n
{
namespace
{

inline constexpr std::size_t numeric_grouping_storage[]{3};

inline constexpr lc_all lc_all_global{.identification={.name=tsc("ko_KR"),.encoding=tsc(FAST_IO_LOCALE_ENCODING),.title=tsc("Korean locale for Republic of Korea"),.source=tsc("fast_io"),.address=tsc("https://gitee.com/qabeowjbtkwb/fast_io\t\t;\t\thttps://github.com/cppfastio/fast_io"),.contact=tsc("fast_io"),.email=tsc("bug-glibc-locales@gnu.org;euloanty@live.com"),.tel=tsc(""),.fax=tsc(""),.language=tsc("Korean"),.territory=tsc("South Korea"),.revision=tsc("1.1"),.date=tsc("2000-11-09")},.monetary={.int_curr_symbol=tsc("KRW "),.currency_symbol=tsc("₩"),.mon_decimal_point=tsc("."),.mon_thousands_sep=tsc(","),.mon_grouping={numeric_grouping_storage,1},.positive_sign=tsc(""),.negative_sign=tsc("-"),.int_frac_digits=0,.frac_digits=0,.p_cs_precedes=1,.p_sep_by_space=0,.n_cs_precedes=1,.n_sep_by_space=0,.p_sign_posn=1,.n_sign_posn=4},.numeric={.decimal_point=tsc("."),.thousands_sep=tsc(","),.grouping={numeric_grouping_storage,1}},.time={.abday={tsc("일"),tsc("월"),tsc("화"),tsc("수"),tsc("목"),tsc("금"),tsc("토")},.day={tsc("일요일"),tsc("월요일"),tsc("화요일"),tsc("수요일"),tsc("목요일"),tsc("금요일"),tsc("토요일")},.abmon={tsc(" 1월"),tsc(" 2월"),tsc(" 3월"),tsc(" 4월"),tsc(" 5월"),tsc(" 6월"),tsc(" 7월"),tsc(" 8월"),tsc(" 9월"),tsc("10월"),tsc("11월"),tsc("12월")},.mon={tsc("1월"),tsc("2월"),tsc("3월"),tsc("4월"),tsc("5월"),tsc("6월"),tsc("7월"),tsc("8월"),tsc("9월"),tsc("10월"),tsc("11월"),tsc("12월")},.d_t_fmt=tsc("%x (%a) %r"),.d_fmt=tsc("%Y년 %m월 %d일"),.t_fmt=tsc("%H시 %M분 %S초"),.t_fmt_ampm=tsc("%p %I시 %M분 %S초"),.date_fmt=tsc("%Y. %m. %d. (%a) %H:%M:%S %Z"),.am_pm={tsc("오전"),tsc("오후")},.week={7,19971130,1}},.messages={.yesexpr=tsc("^[+1yYｙＹ예]"),.noexpr=tsc("^[-0nNｎＮ아]"),.yesstr=tsc("예"),.nostr=tsc("아니요")},.paper={.width=210,.height=297},.telephone={.tel_int_fmt=tsc("+%c %a %l"),.tel_dom_fmt=tsc("(%A) %l"),.int_select=tsc("001"),.int_prefix=tsc("82")},.name={.name_fmt=tsc("%d%t%g%t%m%t%f")},.address={.postal_fmt=tsc("%f%N%a%N%d%N%b%N%s %h %e %r%N%z %T%N%c%N"),.country_name=tsc("대한민국"),.country_ab2=tsc("KR"),.country_ab3=tsc("KOR"),.country_num=410,.country_car=tsc("ROK"),.country_isbn=tsc("979-11,978-89"),.lang_name=tsc("한국어"),.lang_ab=tsc("ko"),.lang_term=tsc("kor"),.lang_lib=tsc("kor")},.measurement={.measurement=1}};

inline constexpr wlc_all wlc_all_global{.identification={.name=tsc(L"ko_KR"),.encoding=tsc(FAST_IO_LOCALE_LENCODING),.title=tsc(L"Korean locale for Republic of Korea"),.source=tsc(L"fast_io"),.address=tsc(L"https://gitee.com/qabeowjbtkwb/fast_io\t\t;\t\thttps://github.com/cppfastio/fast_io"),.contact=tsc(L"fast_io"),.email=tsc(L"bug-glibc-locales@gnu.org;euloanty@live.com"),.tel=tsc(L""),.fax=tsc(L""),.language=tsc(L"Korean"),.territory=tsc(L"South Korea"),.revision=tsc(L"1.1"),.date=tsc(L"2000-11-09")},.monetary={.int_curr_symbol=tsc(L"KRW "),.currency_symbol=tsc(L"₩"),.mon_decimal_point=tsc(L"."),.mon_thousands_sep=tsc(L","),.mon_grouping={numeric_grouping_storage,1},.positive_sign=tsc(L""),.negative_sign=tsc(L"-"),.int_frac_digits=0,.frac_digits=0,.p_cs_precedes=1,.p_sep_by_space=0,.n_cs_precedes=1,.n_sep_by_space=0,.p_sign_posn=1,.n_sign_posn=4},.numeric={.decimal_point=tsc(L"."),.thousands_sep=tsc(L","),.grouping={numeric_grouping_storage,1}},.time={.abday={tsc(L"일"),tsc(L"월"),tsc(L"화"),tsc(L"수"),tsc(L"목"),tsc(L"금"),tsc(L"토")},.day={tsc(L"일요일"),tsc(L"월요일"),tsc(L"화요일"),tsc(L"수요일"),tsc(L"목요일"),tsc(L"금요일"),tsc(L"토요일")},.abmon={tsc(L" 1월"),tsc(L" 2월"),tsc(L" 3월"),tsc(L" 4월"),tsc(L" 5월"),tsc(L" 6월"),tsc(L" 7월"),tsc(L" 8월"),tsc(L" 9월"),tsc(L"10월"),tsc(L"11월"),tsc(L"12월")},.mon={tsc(L"1월"),tsc(L"2월"),tsc(L"3월"),tsc(L"4월"),tsc(L"5월"),tsc(L"6월"),tsc(L"7월"),tsc(L"8월"),tsc(L"9월"),tsc(L"10월"),tsc(L"11월"),tsc(L"12월")},.d_t_fmt=tsc(L"%x (%a) %r"),.d_fmt=tsc(L"%Y년 %m월 %d일"),.t_fmt=tsc(L"%H시 %M분 %S초"),.t_fmt_ampm=tsc(L"%p %I시 %M분 %S초"),.date_fmt=tsc(L"%Y. %m. %d. (%a) %H:%M:%S %Z"),.am_pm={tsc(L"오전"),tsc(L"오후")},.week={7,19971130,1}},.messages={.yesexpr=tsc(L"^[+1yYｙＹ예]"),.noexpr=tsc(L"^[-0nNｎＮ아]"),.yesstr=tsc(L"예"),.nostr=tsc(L"아니요")},.paper={.width=210,.height=297},.telephone={.tel_int_fmt=tsc(L"+%c %a %l"),.tel_dom_fmt=tsc(L"(%A) %l"),.int_select=tsc(L"001"),.int_prefix=tsc(L"82")},.name={.name_fmt=tsc(L"%d%t%g%t%m%t%f")},.address={.postal_fmt=tsc(L"%f%N%a%N%d%N%b%N%s %h %e %r%N%z %T%N%c%N"),.country_name=tsc(L"대한민국"),.country_ab2=tsc(L"KR"),.country_ab3=tsc(L"KOR"),.country_num=410,.country_car=tsc(L"ROK"),.country_isbn=tsc(L"979-11,978-89"),.lang_name=tsc(L"한국어"),.lang_ab=tsc(L"ko"),.lang_term=tsc(L"kor"),.lang_lib=tsc(L"kor")},.measurement={.measurement=1}};

inline constexpr u8lc_all u8lc_all_global{.identification={.name=tsc(u8"ko_KR"),.encoding=tsc(FAST_IO_LOCALE_u8ENCODING),.title=tsc(u8"Korean locale for Republic of Korea"),.source=tsc(u8"fast_io"),.address=tsc(u8"https://gitee.com/qabeowjbtkwb/fast_io\t\t;\t\thttps://github.com/cppfastio/fast_io"),.contact=tsc(u8"fast_io"),.email=tsc(u8"bug-glibc-locales@gnu.org;euloanty@live.com"),.tel=tsc(u8""),.fax=tsc(u8""),.language=tsc(u8"Korean"),.territory=tsc(u8"South Korea"),.revision=tsc(u8"1.1"),.date=tsc(u8"2000-11-09")},.monetary={.int_curr_symbol=tsc(u8"KRW "),.currency_symbol=tsc(u8"₩"),.mon_decimal_point=tsc(u8"."),.mon_thousands_sep=tsc(u8","),.mon_grouping={numeric_grouping_storage,1},.positive_sign=tsc(u8""),.negative_sign=tsc(u8"-"),.int_frac_digits=0,.frac_digits=0,.p_cs_precedes=1,.p_sep_by_space=0,.n_cs_precedes=1,.n_sep_by_space=0,.p_sign_posn=1,.n_sign_posn=4},.numeric={.decimal_point=tsc(u8"."),.thousands_sep=tsc(u8","),.grouping={numeric_grouping_storage,1}},.time={.abday={tsc(u8"일"),tsc(u8"월"),tsc(u8"화"),tsc(u8"수"),tsc(u8"목"),tsc(u8"금"),tsc(u8"토")},.day={tsc(u8"일요일"),tsc(u8"월요일"),tsc(u8"화요일"),tsc(u8"수요일"),tsc(u8"목요일"),tsc(u8"금요일"),tsc(u8"토요일")},.abmon={tsc(u8" 1월"),tsc(u8" 2월"),tsc(u8" 3월"),tsc(u8" 4월"),tsc(u8" 5월"),tsc(u8" 6월"),tsc(u8" 7월"),tsc(u8" 8월"),tsc(u8" 9월"),tsc(u8"10월"),tsc(u8"11월"),tsc(u8"12월")},.mon={tsc(u8"1월"),tsc(u8"2월"),tsc(u8"3월"),tsc(u8"4월"),tsc(u8"5월"),tsc(u8"6월"),tsc(u8"7월"),tsc(u8"8월"),tsc(u8"9월"),tsc(u8"10월"),tsc(u8"11월"),tsc(u8"12월")},.d_t_fmt=tsc(u8"%x (%a) %r"),.d_fmt=tsc(u8"%Y년 %m월 %d일"),.t_fmt=tsc(u8"%H시 %M분 %S초"),.t_fmt_ampm=tsc(u8"%p %I시 %M분 %S초"),.date_fmt=tsc(u8"%Y. %m. %d. (%a) %H:%M:%S %Z"),.am_pm={tsc(u8"오전"),tsc(u8"오후")},.week={7,19971130,1}},.messages={.yesexpr=tsc(u8"^[+1yYｙＹ예]"),.noexpr=tsc(u8"^[-0nNｎＮ아]"),.yesstr=tsc(u8"예"),.nostr=tsc(u8"아니요")},.paper={.width=210,.height=297},.telephone={.tel_int_fmt=tsc(u8"+%c %a %l"),.tel_dom_fmt=tsc(u8"(%A) %l"),.int_select=tsc(u8"001"),.int_prefix=tsc(u8"82")},.name={.name_fmt=tsc(u8"%d%t%g%t%m%t%f")},.address={.postal_fmt=tsc(u8"%f%N%a%N%d%N%b%N%s %h %e %r%N%z %T%N%c%N"),.country_name=tsc(u8"대한민국"),.country_ab2=tsc(u8"KR"),.country_ab3=tsc(u8"KOR"),.country_num=410,.country_car=tsc(u8"ROK"),.country_isbn=tsc(u8"979-11,978-89"),.lang_name=tsc(u8"한국어"),.lang_ab=tsc(u8"ko"),.lang_term=tsc(u8"kor"),.lang_lib=tsc(u8"kor")},.measurement={.measurement=1}};

inline constexpr u16lc_all u16lc_all_global{.identification={.name=tsc(u"ko_KR"),.encoding=tsc(FAST_IO_LOCALE_uENCODING),.title=tsc(u"Korean locale for Republic of Korea"),.source=tsc(u"fast_io"),.address=tsc(u"https://gitee.com/qabeowjbtkwb/fast_io\t\t;\t\thttps://github.com/cppfastio/fast_io"),.contact=tsc(u"fast_io"),.email=tsc(u"bug-glibc-locales@gnu.org;euloanty@live.com"),.tel=tsc(u""),.fax=tsc(u""),.language=tsc(u"Korean"),.territory=tsc(u"South Korea"),.revision=tsc(u"1.1"),.date=tsc(u"2000-11-09")},.monetary={.int_curr_symbol=tsc(u"KRW "),.currency_symbol=tsc(u"₩"),.mon_decimal_point=tsc(u"."),.mon_thousands_sep=tsc(u","),.mon_grouping={numeric_grouping_storage,1},.positive_sign=tsc(u""),.negative_sign=tsc(u"-"),.int_frac_digits=0,.frac_digits=0,.p_cs_precedes=1,.p_sep_by_space=0,.n_cs_precedes=1,.n_sep_by_space=0,.p_sign_posn=1,.n_sign_posn=4},.numeric={.decimal_point=tsc(u"."),.thousands_sep=tsc(u","),.grouping={numeric_grouping_storage,1}},.time={.abday={tsc(u"일"),tsc(u"월"),tsc(u"화"),tsc(u"수"),tsc(u"목"),tsc(u"금"),tsc(u"토")},.day={tsc(u"일요일"),tsc(u"월요일"),tsc(u"화요일"),tsc(u"수요일"),tsc(u"목요일"),tsc(u"금요일"),tsc(u"토요일")},.abmon={tsc(u" 1월"),tsc(u" 2월"),tsc(u" 3월"),tsc(u" 4월"),tsc(u" 5월"),tsc(u" 6월"),tsc(u" 7월"),tsc(u" 8월"),tsc(u" 9월"),tsc(u"10월"),tsc(u"11월"),tsc(u"12월")},.mon={tsc(u"1월"),tsc(u"2월"),tsc(u"3월"),tsc(u"4월"),tsc(u"5월"),tsc(u"6월"),tsc(u"7월"),tsc(u"8월"),tsc(u"9월"),tsc(u"10월"),tsc(u"11월"),tsc(u"12월")},.d_t_fmt=tsc(u"%x (%a) %r"),.d_fmt=tsc(u"%Y년 %m월 %d일"),.t_fmt=tsc(u"%H시 %M분 %S초"),.t_fmt_ampm=tsc(u"%p %I시 %M분 %S초"),.date_fmt=tsc(u"%Y. %m. %d. (%a) %H:%M:%S %Z"),.am_pm={tsc(u"오전"),tsc(u"오후")},.week={7,19971130,1}},.messages={.yesexpr=tsc(u"^[+1yYｙＹ예]"),.noexpr=tsc(u"^[-0nNｎＮ아]"),.yesstr=tsc(u"예"),.nostr=tsc(u"아니요")},.paper={.width=210,.height=297},.telephone={.tel_int_fmt=tsc(u"+%c %a %l"),.tel_dom_fmt=tsc(u"(%A) %l"),.int_select=tsc(u"001"),.int_prefix=tsc(u"82")},.name={.name_fmt=tsc(u"%d%t%g%t%m%t%f")},.address={.postal_fmt=tsc(u"%f%N%a%N%d%N%b%N%s %h %e %r%N%z %T%N%c%N"),.country_name=tsc(u"대한민국"),.country_ab2=tsc(u"KR"),.country_ab3=tsc(u"KOR"),.country_num=410,.country_car=tsc(u"ROK"),.country_isbn=tsc(u"979-11,978-89"),.lang_name=tsc(u"한국어"),.lang_ab=tsc(u"ko"),.lang_term=tsc(u"kor"),.lang_lib=tsc(u"kor")},.measurement={.measurement=1}};

inline constexpr u32lc_all u32lc_all_global{.identification={.name=tsc(U"ko_KR"),.encoding=tsc(FAST_IO_LOCALE_UENCODING),.title=tsc(U"Korean locale for Republic of Korea"),.source=tsc(U"fast_io"),.address=tsc(U"https://gitee.com/qabeowjbtkwb/fast_io\t\t;\t\thttps://github.com/cppfastio/fast_io"),.contact=tsc(U"fast_io"),.email=tsc(U"bug-glibc-locales@gnu.org;euloanty@live.com"),.tel=tsc(U""),.fax=tsc(U""),.language=tsc(U"Korean"),.territory=tsc(U"South Korea"),.revision=tsc(U"1.1"),.date=tsc(U"2000-11-09")},.monetary={.int_curr_symbol=tsc(U"KRW "),.currency_symbol=tsc(U"₩"),.mon_decimal_point=tsc(U"."),.mon_thousands_sep=tsc(U","),.mon_grouping={numeric_grouping_storage,1},.positive_sign=tsc(U""),.negative_sign=tsc(U"-"),.int_frac_digits=0,.frac_digits=0,.p_cs_precedes=1,.p_sep_by_space=0,.n_cs_precedes=1,.n_sep_by_space=0,.p_sign_posn=1,.n_sign_posn=4},.numeric={.decimal_point=tsc(U"."),.thousands_sep=tsc(U","),.grouping={numeric_grouping_storage,1}},.time={.abday={tsc(U"일"),tsc(U"월"),tsc(U"화"),tsc(U"수"),tsc(U"목"),tsc(U"금"),tsc(U"토")},.day={tsc(U"일요일"),tsc(U"월요일"),tsc(U"화요일"),tsc(U"수요일"),tsc(U"목요일"),tsc(U"금요일"),tsc(U"토요일")},.abmon={tsc(U" 1월"),tsc(U" 2월"),tsc(U" 3월"),tsc(U" 4월"),tsc(U" 5월"),tsc(U" 6월"),tsc(U" 7월"),tsc(U" 8월"),tsc(U" 9월"),tsc(U"10월"),tsc(U"11월"),tsc(U"12월")},.mon={tsc(U"1월"),tsc(U"2월"),tsc(U"3월"),tsc(U"4월"),tsc(U"5월"),tsc(U"6월"),tsc(U"7월"),tsc(U"8월"),tsc(U"9월"),tsc(U"10월"),tsc(U"11월"),tsc(U"12월")},.d_t_fmt=tsc(U"%x (%a) %r"),.d_fmt=tsc(U"%Y년 %m월 %d일"),.t_fmt=tsc(U"%H시 %M분 %S초"),.t_fmt_ampm=tsc(U"%p %I시 %M분 %S초"),.date_fmt=tsc(U"%Y. %m. %d. (%a) %H:%M:%S %Z"),.am_pm={tsc(U"오전"),tsc(U"오후")},.week={7,19971130,1}},.messages={.yesexpr=tsc(U"^[+1yYｙＹ예]"),.noexpr=tsc(U"^[-0nNｎＮ아]"),.yesstr=tsc(U"예"),.nostr=tsc(U"아니요")},.paper={.width=210,.height=297},.telephone={.tel_int_fmt=tsc(U"+%c %a %l"),.tel_dom_fmt=tsc(U"(%A) %l"),.int_select=tsc(U"001"),.int_prefix=tsc(U"82")},.name={.name_fmt=tsc(U"%d%t%g%t%m%t%f")},.address={.postal_fmt=tsc(U"%f%N%a%N%d%N%b%N%s %h %e %r%N%z %T%N%c%N"),.country_name=tsc(U"대한민국"),.country_ab2=tsc(U"KR"),.country_ab3=tsc(U"KOR"),.country_num=410,.country_car=tsc(U"ROK"),.country_isbn=tsc(U"979-11,978-89"),.lang_name=tsc(U"한국어"),.lang_ab=tsc(U"ko"),.lang_term=tsc(U"kor"),.lang_lib=tsc(U"kor")},.measurement={.measurement=1}};


}
}

#include"../main.h"