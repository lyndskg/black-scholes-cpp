//
//  hestonModel.cpp
//  black-scholes
//
//  Created by lyndskg on 7/18/23.


#include <iostream>
#include <cassert>
#include <cmath>
#include <random>

#include "../include/black-scholes-cpp/hestonModel.h"

using namespace std;

// Include the declaration of the fast_io function
extern void fast_io();


// ------------------------------------------------------------------------------------------------
//            "hestonModel" Class Member Function Implementations
// ------------------------------------------------------------------------------------------------
/*----------------------------------------  CONSTRUCTORS  ----------------------------------------*/
// Default constructor.
hestonModel::hestonModel() : blackScholesModel() {
    // Call fast_io to optimize I/O speed
    fast_io();
    
    V0_ = 0.0;
    kappa_ = 0.0;
    theta_ = 0.0;
    sigma_ = 0.0;
    rho_ = 0.0;
}

// Custom constructor.
hestonModel::hestonModel(double underlyingPrice, double strikePrice, double riskFreeRate,
                         double timeToExpiration, double volatility, double V0, double kappa,
                         double theta, double sigma, double rho, OptionType optionType) :
    blackScholesModel(underlyingPrice, strikePrice, riskFreeRate, timeToExpiration,
                      volatility, optionType),
    V0_(V0), kappa_(kappa), theta_(theta), sigma_(sigma), rho_(rho) {
        // Call fast_io to optimize I/O speed
        fast_io();
    }


/*------------------------------------- KEY MEMBER FUNCTIONS  ------------------------------------*/

// Calculates the option price using the Heston model with stochastic volatility.
double hestonModel::calculateOptionPrice() {
    // Calculate the intermediate variables (i.e., 'd1' and 'd2').
    double d1 = calculateD1(underlyingPrice, strikePrice,
                            timeToExpiration, riskFreeRate, volatility);
    double d2 = calculateD2(underlyingPrice, strikePrice,
                            timeToExpiration, riskFreeRate, volatility);

    // Calculate the Heston model variance using Euler discretization
    double dt = timeToExpiration / num_time_steps;
    double Vt = V0_;
    
    for (int i = 0; i < num_time_steps; i++) {
        double Z1 = random_normal();
        double Z2 = rho_ * Z1 + sqrt(1.0 - rho_ * rho_) * random_normal();
        Vt = max(0.0, Vt + kappa_ * (theta_ - Vt) * dt + sigma_ * sqrt(Vt * dt) * Z1);
    } // for

    // Calculate the option price based on the option type (i.e., 'Call' vs. 'Put').
    switch (optionType) {
        case OptionType::CALL:
            // Calculate and return the call option price using the Black-Scholes formula
            // with Heston volatility
            return underlyingPrice * normalCDF(d1) - strikePrice
                        * exp(-riskFreeRate * timeToExpiration) * normalCDF(d2);
        case OptionType::PUT:
            // Calculate and return the put option price using the Black-Scholes formula
            // with Heston volatility
            return strikePrice * exp(-riskFreeRate * timeToExpiration) * normalCDF(-d2)
            - underlyingPrice * normalCDF(-d1);
        default:
            cerr << "Error: Option type does not exist!\n";
            return -1;
    } // switch
} // calculateOptionPrice()


// Function to generate a random number from a standard normal distribution
double hestonModel::random_normal() {
    static default_random_engine generator;
    static normal_distribution<double> distribution(0.0, 1.0);
    
    return distribution(generator);
} // random_normal()


/*--------------------------------------  SETTER METHODS  ---------------------------------------*/

// Setter method for V0.
void hestonModel::setV0(double value) const {
    V0_ = value;
} // setV0()


// Setter method for Kappa.
void hestonModel::setKappa(double value) const {
    kappa_ = value;
} // setKappa()


// Setter method for Theta.
void hestonModel::setTheta(double value) const {
    theta_ = value;
} // setTheta()

 
// Setter method for Sigma.
void hestonModel::setSigma(double value) const {
    sigma_ = value;
} // setSigma()


// Setter method for Rho.
void hestonModel::setRho(double value) const {
    rho_ = value;
} // setRho()


/*-----------------------------------  GETTER METHODS  -------------------------------------------*/


// Getter method for V0.
const double& hestonModel::getV0() const {
    return V0_;
} // getV0()


// Getter method for Kappa.
const double& hestonModel::getKappa() const {
    return kappa_;
} // getKappa()


// Getter method for Theta.
const double& hestonModel::getTheta() const {
    return theta_;
} // getTheta()


// Getter method for Sigma.
const double& hestonModel::getSigma() const {
    return sigma_;
} // getSigma()


// Getter method for Rho.
const double& hestonModel::getRho() const {
    return rho_;
} // getRho()




// TODO: FIX THIS SHIT

//// Function to generate a random number from a standard normal distribution
//double hestonModel::random_normal() {
//    static VSLStreamStatePtr stream;
//    static int seed = 1;
//    static int n = 1; // Number of random numbers to generate
//    static double result;
//
//    // Initialize the random number generator stream if not already initialized
//    if (stream == NULL) {
//        vslNewStream(&stream, VSL_BRNG_MT19937, seed);
//        vslLeapfrogStream(stream, n);
//    } //if
//
//    // Generate a random number from a standard normal distribution
//    vdRngGaussian(VSL_RNG_METHOD_GAUSSIAN_BOXMULLER2, stream, n, &result, 0.0, 1.0);
//
//    return result;
//} // random_normal()
