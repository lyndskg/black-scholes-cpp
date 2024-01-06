//
//  blackScholesModel_tests.cpp
//  black-scholes
//
//  Created by lyndskg on 7/19/23.
//

#ifndef BLACK_SCHOLES_MODEL_TESTS_H
#define BLACK_SCHOLES_MODEL_TESTS_H

#include <stdio.h>
#include <iostream>
#include <cassert>

#include "../gtest/gtest.h"
#include "gtest_main.cpp"
#include "../include/black-scholes-cpp/blackScholesModel.h"
#include "../src/blackScholesModel.cpp"

using namespace std;


// Test the default constructor of blackScholesModel.
TEST(blackScholesModelTest, DefaultConstructor) {
// Arrange
blackScholesModel model;

// Act (no action needed for a constructor)

// Assert
EXPECT_EQ(0.0, model.getUnderlyingPrice());
EXPECT_EQ(0.0, model.getStrikePrice());
EXPECT_EQ(0.0, model.getRFR());
EXPECT_EQ(0.0, model.getTTE());
EXPECT_EQ(0.0, model.getVolatility());
EXPECT_EQ(blackScholesModel::OptionType::CALL, model.getOptionType());
}

// Add more tests as needed


#endif //BLACK_SCHOLES_MODEL_TESTS_H