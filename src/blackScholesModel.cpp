//
//  blackScholesModel.cpp
//  black-scholes
//
//  Created by lyndskg on 7/12/23.

#include <cmath>
#include <iostream> // For cerr functionality.
#include <string>
#include <numbers>
#include <cassert>

#include "../include/black-scholes-cpp/blackScholesModel.h"

using namespace std;


// ----------------------------------------------------------------------------
//           "blackScholesModel" Class Member Function Implementations
// ----------------------------------------------------------------------------


/*------------------------------  CONSTRUCTORS  ------------------------------*/
// Default constructor.
blackScholesModel::blackScholesModel() {
    // Initialize member variables directly.
    underlyingPrice = 0.0;
    strikePrice = 0.0;
    riskFreeRate = 0.0;
    timeToExpiration = 0.0;
    volatility  = 0.0;
    optionType = OptionType::CALL; // Set a default value
}

// Custom constructor for optionGreeks derived class.
blackScholesModel::blackScholesModel(double underlyingPrice, double strikePrice,
                                     double riskFreeRate, double timeToExpiration,
                                     double volatility) :
        underlyingPrice(underlyingPrice), strikePrice(strikePrice),
        riskFreeRate(riskFreeRate), timeToExpiration(timeToExpiration),
        volatility(volatility), optionType(OptionType::CALL) {
            
            // Calculate and store intermediate variables.
            d1_ = calculateD1(underlyingPrice, strikePrice, timeToExpiration, riskFreeRate, volatility);
            d2_ = calculateD2(underlyingPrice, strikePrice, timeToExpiration, riskFreeRate, volatility);
            K_ = calculateK(d1_);
}


// Custom constructor for general usage.
//
// Initializes all member functions used in the pricing formula via getter methods.
// TODO: Finish 
blackScholesModel::blackScholesModel(double underlyingPrice, double strikePrice, double riskFreeRate,
                  double timeToExpiration, double volatility, OptionType optionType) :
        underlyingPrice(underlyingPrice), strikePrice(strikePrice),
        riskFreeRate(riskFreeRate), timeToExpiration(timeToExpiration),
        volatility(volatility), optionType(OptionType::CALL) {
        
            // Calculate and store intermediate variables.
            d1_ = calculateD1(underlyingPrice, strikePrice, timeToExpiration, riskFreeRate, volatility);
            d2_ = calculateD2(underlyingPrice, strikePrice, timeToExpiration, riskFreeRate, volatility);
            K_ = calculateK(d1_);
}

/*------------------------------ KEY MEMBER FUNCTIONS  ------------------------------*/
/*------------------------------       { math }        ------------------------------*/
 

// Defines the option pricing function and calculates the option price using the Black-Scholes formula.
double blackScholesModel::calculateOptionPrice() {
    // Calculate the intermediate variables (i.e. 'd1' and 'd2').
    d1_ = calculateD1(underlyingPrice, strikePrice, timeToExpiration, riskFreeRate, volatility);
    d2_ = calculateD2(underlyingPrice, strikePrice, timeToExpiration, riskFreeRate, volatility);
    
    // Calculate the option price based on the option type (i.e. 'Call' vs. 'Put').
    switch (optionType) {
        // If the option type is 'C' (call):
        case OptionType::CALL:
            // Calculate and return the call option price using the Black-Scholes formula.
            return underlyingPrice * normalCDF(d1_) - strikePrice
                    * exp(-riskFreeRate * timeToExpiration) * normalCDF(d2_);
            
        // If the option type is 'P' (put):
        case OptionType::PUT:
            // Calculate and return the put option price using the Black-Scholes formula.
            return strikePrice * exp(-riskFreeRate * timeToExpiration)
                    * normalCDF(-d2_) - underlyingPrice * normalCDF(-d1_);
            
        // If neither option type is specified:
        default:
            // Dislpay an error message
            cerr << "Error: Option type does not exist!\n";
            return -1; // Exit the function and program with erroneous return code.
    } // switch

} // calculateOptionPrice()


// Approximates the cumulative distribution function (CDF) of a normal distribution.
double blackScholesModel::normalCDF(double d) const {
    // Abramowitz & Stegun's (1964) approximation !!
                
    /* Refer to https://www.ijser.org/researchpaper/Approximations-to-Standard-Normal-Distribution-Function.pdf
       for potentially more efficient approximations wrt M.A.E. and corresponding z-score */
    
    // The array 'a' contains pre-defined coefficients used in the approximation formula.
    const double a[] = {0.31938153, -0.356563782, 1.781477937, -1.821255978, 1.330274429};
    
    double L = abs(d); // Calculate the absolute value of 'd'.
    double K = getK(); // Access the stored value of 'K' from the member variable 'K_'.
    
    // Calculate the approximation of the CDF based on the coefficients and intermediate values.
    double result = 1.0 - 1.0 / sqrt(2 * numbers::pi) * exp(-L * L / 2.0)
                    * (a[0] * K + a[1] * K * K + a[2] * pow(K, 3.0) + a[3] * pow(K, 4.0) + a[4] + pow(K, 5.0));
    
    // Return the result based on the sign of 'd'.
    return d < 0 ? 1.0 - result : result; // Should ternary operator be used here? Or if-else statement (below)?
    
    // The ternary operator is used to return 1.0 minus the result if 'd' is negative, or the result
    // itself if 'd' is non-negative.
    // Alternatively, an if-else statement can be used to achieve the same result.
    
} // normalCDF()


// Calculate the intermediate variable 'd1'.
double blackScholesModel::calculateD1(double underlyingPrice, double strikePrice,
                                      double timeToExpiration,double riskFreeRate,
                                      double volatility) const {
    double numerator = log(underlyingPrice / strikePrice)
                        + (riskFreeRate + 0.5 * volatility * volatility) * timeToExpiration;
    double denominator = volatility * sqrt(timeToExpiration);
    
    double d1 = numerator / denominator;
    
    // Store the calculated value of 'd1'.
    setD1(d1);
    
    return d1;
} // calculateD1()


// Calculate the intermediate variable 'd2'.
double blackScholesModel::calculateD2(double underlyingPrice, double strikePrice,
                                      double timeToExpiration, double riskFreeRate,
                                      double volatility) const {
    double d2 = calculateD1(underlyingPrice, strikePrice, timeToExpiration, riskFreeRate, volatility)
    - volatility * sqrt(timeToExpiration);
    
    // Store the calculated value of 'd2'.
    setD2(d2);
    
    return d2;
} // calculateD2()


// Calculates the intermediate variable 'K'.
double blackScholesModel::calculateK(double d) const {
    double K = 1.0 / (1.0 + 0.2316419 * abs(d)); // Calculate the intermediate value 'K'.
    
    // Store the calculated value of 'K'.
    setK(K);
    
    return K;
} // calculateK()


/*--------------------------------  SETTER METHODS  --------------------------------*/

// Setter method for the underlying price of the Black-Scholes model.
void blackScholesModel::setUnderlyingPrice(const double& value) {
    underlyingPrice = value;
} // setUnderlyingPrice()


// Setter method for the strike price of the Black-Scholes model.
void blackScholesModel::setStrikePrice(const double& value) {
    strikePrice = value;
}// setStrikePrice()


// Setter method for the time until expiration of the Black-Scholes model.
void blackScholesModel::setTTE(const double& value) {
    timeToExpiration = value;
} // setTTE()


// Setter method for the risk-free rate of the Black-Scholes model.
void blackScholesModel::setRFR(const double& value) {
    riskFreeRate = value;
} // setRFR()


// Setter method for the volatility of the Black-Scholes model.
void blackScholesModel::setVolatility(const double& value) {
    volatility = value;
} // setVolatility()


// Setter method for the option type of the Black-Scholes model.
void blackScholesModel::setOptionType(const OptionType& value) {
    optionType = value;
} // setOptionType()


// Setter method for intermediate variable 'd1' of the Black-Scholes model.
void blackScholesModel::setD1(const double& value) const {
    d1_ = value;
} // setD1()


// Setter method for intermediate variable 'd2' of the Black-Scholes model.
void blackScholesModel::setD2(const double& value) const {
    d2_ = value;
} // setD2()


// Setter method for intermediate variable 'K' of the Black-Scholes model.
void blackScholesModel::setK(const double& value) const {
    K_ = value;
} // setK()


/*--------------------------------  GETTER METHODS  --------------------------------*/

// Getter method for the underlying price of the Black-Scholes model.
const double& blackScholesModel::getUnderlyingPrice() const {
    return underlyingPrice;
} // getUnderlyingPrice()


// Getter method for the strike price of the Black-Scholes model.
const double& blackScholesModel::getStrikePrice() const {
    return strikePrice;
} // getStrikePrice()


// Getter method for the time until expiration of the Black-Scholes model.
const double& blackScholesModel::getTTE() const {
    return timeToExpiration;
} // getTTE()


// Getter method for the risk-free rate of the Black-Scholes model.
const double& blackScholesModel::getRFR() const {
    return riskFreeRate;
} // getRFR()


// Getter method for the volatility of the Black-Scholes model.
const double& blackScholesModel::getVolatility() const {
    return volatility;
} // getVolatility()


// Getter method for the option type of the Black-Scholes model.
blackScholesModel::OptionType blackScholesModel::getOptionType() const {
    return optionType;
} // getOptionType()


// Getter method for the intermediate variable 'd1' of the Black-Scholes model.
const double& blackScholesModel::getD1() const {
    return d1_;
} // getD1()


// Getter method for the intermediate variable 'd2' of the Black-Scholes model.
const double& blackScholesModel::getD2() const {
    return d2_;
} // getD2()


// Getter method for the intermediate variable 'K' of the Black-Scholes model.
const double& blackScholesModel::getK() const {
    return K_;
} // getK()
