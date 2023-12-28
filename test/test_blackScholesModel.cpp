//
//  blackScholesModel_tests.cpp
//  black-scholes
//
//  Created by lyndskg on 7/19/23.
//

#include <stdio.h>
#include <iostream>
#include <cassert>

#include "src/blackScholesModel.h"
#include <gtest/gtest.h>
#include "../src/blackScholesModel/blackScholesModel.cpp"  // Include the source file you want to test
#include "unit_test_framework.h"

using namespace std;

// Test the default constructor of blackScholesModel
TEST(blackScholesModelTest, DefaultConstructor) {
// Arrange
blackScholesModel model;

// Act (no action needed for a constructor)

// Assert
EXPECT_EQ(0.0, model.getUnderlyingPrice());
EXPECT_EQ(0.0, model.getStrikePrice());
EXPECT_EQ(0.0, model.getRiskFreeRate());
EXPECT_EQ(0.0, model.getTimeToExpiration());
EXPECT_EQ(0.0, model.getVolatility());
EXPECT_EQ(OptionType::CALL, model.getOptionType());
}

// Add more tests as needed

