//
//  Program_tests.cpp
//  black-scholes
//
//  Created by lyndskg on 7/19/23.
//

#include <stdio.h>
#include <cassert>
#include <iostream>
#include <fstream>

#include "main.cpp"
#include "Program.h"
#include "blackScholesModel.h"
#include "inputReader.h"
#include "unit_test_framework.h"


using namespace std;

using Test_func_t = void (*)();

// Demonstrate some basic assertions.
TEST(test_default_ctor) {
    Program program;
    
    ASSERT_EQUAL(program.inputMode, program.readInputMode());
    ASSERT_TRUE(program.inputMode.empty());
    ASSERT_EQUAL(program.inputMode, "");
    ASSERT_FALSE(sizeof(program.inputMode) > 0);
    ASSERT_FALSE(program.inputMode != "");
}

TEST(test_get_opts) {
    
}
    
