//
//  optionGreeks.cpp
//  black-scholes
//
//  Created by lyndskg on 7/18/23.


#include <cmath>

#include "optionGreeks.h"
#include "blackScholesModel.h"


// ----------------------------------------------------------------------------
//            "optionGreeks" Class Member Function Implementations
// ----------------------------------------------------------------------------

/*------------------------------  CONSTRUCTORS  ------------------------------*/
// Default constructor.
optionGreeks::optionGreeks() {
    d1_ = getD1();
    d2_ = getD2();
    K_ = getK();
    delta_ = getDelta();
    gamma_ = getGamma();
    vega_ = getVega();
    theta_ = getTheta();
    rho_ = getRho();
}

// Custom constructor.
optionGreeks::optionGreeks(double underlyingPrice, double strikePrice, double timeToExpiration,
                           double riskFreeRate, double volatility) :
            blackScholesModel(underlyingPrice, strikePrice, timeToExpiration,
                              riskFreeRate, volatility) {
                d1_ = getD1();
                d2_ = getD2();
                K_ = getK();
                delta_ = getDelta();
                gamma_ = getGamma();
                vega_ = getVega();
                theta_ = getTheta();
                rho_ = getRho();
} // optionGreeks ctor


/*--------------------------  KEY MEMBER FUNCTIONS  --------------------------*/

// TODO: IMPLEMENT CALCULATEIV??


// Delta measures the change in option price for a unit change in the underlying asset price.
double optionGreeks::calculateDelta() const {
    // Calculate Delta using 'd1'.
    double delta = exp(-d1_ * d1_ / 2) / sqrt(2 * M_PI);

    // Store delta.
    setDelta(delta);
    
    return delta;
} // calculateDelta()


// Gamma measures the rate of change of Delta concerning changes in the underlying asset price.
double optionGreeks::calculateGamma() const {
    // Calculate Gamma using d1
    double gamma = exp(-d1_ * d1_ / 2) /
                    (sqrt(2 * M_PI) * underlyingPrice * volatility * sqrt(timeToExpiration));
    
    // Store gamma.
    setGamma(gamma);

    return gamma;
} // calculateGamma()


// Theta measures the rate of time decay of an option's value.
double optionGreeks::calculateTheta() const {
    // Calculate Theta using d1, d2, and other necessary variables.
    double theta = -underlyingPrice * exp(-d1_ * d1_ / 2) * volatility / (2 * sqrt(timeToExpiration))
                    - riskFreeRate * K_ * exp(-riskFreeRate * timeToExpiration) * normalCDF(d2_);

    // Store theta.
    setTheta(theta);
    
    return theta;
} // calculateTheta()


// Vega measures the sensitivity of an option's price to changes in implied volatility.
double optionGreeks::calculateVega() const {
    // Calculate Vega using 'd1'.
    double vega = underlyingPrice * exp(-d1_ * d1_ / 2) * sqrt(timeToExpiration);

    // Store vega.
    setVega(vega);
    
    return vega;
} // calculateVega()



// Rho measures the sensitivity of an option's price to changes in the risk-free interest rate.
double optionGreeks::calculateRho() const {
    // Calculate Rho using 'd2' and 'K'.
    double rho = K_ * timeToExpiration * exp(-riskFreeRate * timeToExpiration) * normalCDF(d2_);

    // Store rho.
    setRho(rho);
    
    return rho;
} // calculateRho()


/*--------------------------  SETTER METHODS  --------------------------*/

// Setter method for the Delta value of option Greeks.
void optionGreeks::setDelta(const double& value) const {
    delta_ = value;
} // setDelta()


// Setter method for the Gamma value of option Greeks.
void optionGreeks::setGamma(const double& value) const {
    gamma_ = value;
} // setGamma()


// Setter method for the Vega value of option Greeks.
void optionGreeks::setVega(const double& value) const {
    vega_ = value;
} // setVega()


// Setter method for the Theta value of option Greeks.
void optionGreeks::setTheta(const double& value) const {
    theta_ = value;
} // setTheta()


// Setter method for the Rho value of option Greeks.
void optionGreeks::setRho(const double& value) const {
    rho_ = value;
} // setRho()


/*--------------------------  GETTER METHODS  --------------------------*/

// Getter method for the Delta value of option Greeks.
const double& optionGreeks::getDelta() const {
    return delta_;
} // getDelta()


// Getter method for the Gamma value of option Greeks.
const double& optionGreeks::getGamma() const {
    return gamma_;
} // getGamma()

// Getter method for the Vega value of option Greeks.
const double& optionGreeks::getVega() const {
    return vega_;
} // getVega()


// Getter method for the Theta value of option Greeks.
const double& optionGreeks::getTheta() const {
    return theta_;
} // getTheta()


// Getter method for the Rho value of option Greeks.
const double& optionGreeks::getRho() const {
    return rho_;
} // getRho()
