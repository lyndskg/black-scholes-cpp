//
//  optionGreeksModel.cpp
//  black-scholes
//
//  Created by lyndskg on 7/18/23.

#include <iostream>

#include "../include/black-scholes-cpp/optionGreeksModel.h"

using namespace std;

// Include the declaration of the fast_io function
extern void fast_io();

// ----------------------------------------------------------------------------------------------------
//                  "optionGreeksModel" Class Member Function Implementations
// ----------------------------------------------------------------------------------------------------
/*------------------------------------------  CONSTRUCTORS  ------------------------------------------*/

// Default constructor.
optionGreeksModel::optionGreeksModel() : blackScholesModel(), optionGreeks() {
    // Call fast_io to optimize I/O speed
    fast_io();
}


// Custom constructor.
optionGreeksModel::optionGreeksModel(double underlyingPrice, double strikePrice, 
                                     double timeToExpiration, double riskFreeRate, double volatility) :
                                     blackScholesModel(), optionGreeks(underlyingPrice, strikePrice, 
                                     timeToExpiration, riskFreeRate, volatility) {
    // Call fast_io to optimize I/O speed
    fast_io();
        
    // TODO: Parameterized constructor implementation.
}

/*------------------------------------- KEY MEMBER FUNCTIONS  -----------------------------------------*/

// Calculates the number of shares needed to maintain a delta-neutral position -- determining
// the appropriate action (i.e. buy or sell) and executing the corresponding order.
// TODO: Implement more thoroughly
void optionGreeksModel::performDeltaNeutralHedging(double hedgeRatio) {
    // Calculate the number of shares to hedge based on the delta and hedge ratio
    int sharesToHedge = static_cast<int>(getDelta() * hedgeRatio);

    // Check if additional shares need to be bought
    if (sharesToHedge > 0) {
        // Buy shares to maintain Delta-neutral position
        double totalCost = sharesToHedge * underlyingPrice;
        // Execute the buy order
        // ...
        
        // Print a message indicating the buy order details.
        cout << "Buy " << sharesToHedge << " shares for a total of " << totalCost << endl;
    } // if
    
    // Check if shares need to be sold
    else if (sharesToHedge < 0) {
        // Sell shares to maintain Delta-neutral position
        double totalProceeds = -sharesToHedge * underlyingPrice;
        // Execute the sell order
        // ...
        
        // Print a message indicating the sell order details
        cout << "Sell " << -sharesToHedge << " shares for a proceeds of "
                        << totalProceeds << endl;
    } // elif
    
    // No action needed for a delta-neutral position
    else {
        // Print a message indicating that no action is required
        cout << "No action needed. Position is already delta-neutral.\n";
    } // else
    
} // performDeltaNeutralHedging()


// Calculates the option price taking implied volatility (IV) as an additional input
// parameter used to re-calculate the Delta value.
double optionGreeksModel::calculateOptionPriceWithIV(double underlyingPrice, double strikePrice,
                                                     double timeToExpiration, double riskFreeRate,
                                                     double impliedVolatility) const {
    // Calculate the Delta value using the implied volatility
    double delta = calculateDeltaAdjWithIV(impliedVolatility);
    
    // Calculate d1 and d2 using the adjusted inputs
    double d1 = calculateD1(underlyingPrice, strikePrice, timeToExpiration, riskFreeRate,
                            impliedVolatility);
    double d2 = d1 - (impliedVolatility * sqrt(timeToExpiration));
    
    // Calculate the option price using the pricing formula, incorporating Delta,
    // underlying price, strike price, time to expiration, risk-free rate, and implied volatility
    double optionPriceIv = (delta * underlyingPrice * normalCDF(d1))
                           - (strikePrice * exp(-riskFreeRate * timeToExpiration) * normalCDF(d2));
    
    setOptionPriceIv(optionPriceIv);
    
    return optionPriceIv;
}


// Calculates the option price with Gamma adjustments, incorporating Delta and Gamma values
// as well as the adjusted Delta.
double optionGreeksModel::calculateOptionPriceWithGamma(double underlyingPrice,
                                                        double strikePrice, double timeToExpiration,
                                                        double riskFreeRate) const {
    // Calculate the Delta and Gamma values
    double delta = getDelta(), gamma = getGamma();

    // Adjust the Delta based on the Gamma value
    double gammaAdjustedDelta = getGammaAdjustedDelta();
    
    // Calculate the discounted strike price by discounting the strike price to the present
    // value using the risk-free rate
    double discountedStrikePrice = strikePrice * exp(-riskFreeRate * timeToExpiration);
    
    // Calculate the option price using the pricing formula incorporating adjustedDelta
    double optionPriceGamma = (gammaAdjustedDelta * underlyingPrice) - discountedStrikePrice;
    
    setOptionPriceGamma(optionPriceGamma);
    
    // Return the calculated option price
    return optionPriceGamma;
} // calculateOptionPriceWithGamma()


// Calculates the option price with Vega adjustments, incorporating Delta and Vega values
// as well as the adjusted Delta.
double optionGreeksModel::calculateOptionPriceWithVega(double underlyingPrice, double strikePrice,
                                                       double timeToExpiration, double riskFreeRate)
                                                                                const {
    double delta = getDelta(), vega = getVega();

    // Calculate the Vega-adjusted Delta
    double vegaAdjustedDelta = getVegaAdjustedDelta();
    
    // Calculate the option price using the pricing formula, incorporating Delta, Vega, Vega-adjusted Delta, 
    // and other parameters
    double optionPriceVega = delta * underlyingPrice - vega * vegaAdjustedDelta + (0.5 * vega * vega);

    setOptionPriceVega(optionPriceVega);
    
    return optionPriceVega;
} // calculateOptionPriceWithVega()



// Calculates the option price with Theta adjustments, incorporating Delta and Theta values
// as well as the adjusted Delta.
double optionGreeksModel::calculateOptionPriceWithTheta(double underlyingPrice, double strikePrice,
                                     double timeToExpiration, double riskFreeRate) const {
    double delta = getDelta(), theta = getTheta();
    
    double thetaAdjustedDelta = getThetaAdjustedDelta();
    
    double optionPriceTheta = delta * underlyingPrice -
                              theta * timeToExpiration +
                              thetaAdjustedDelta - (strikePrice * exp(-riskFreeRate * timeToExpiration));
    
    setOptionPriceTheta(optionPriceTheta);
    
    return optionPriceTheta;
} // calculateOptionPriceWithTheta()


// Calculates the option price with Gamma and Vega adjustments, incprorating Delta and Gamma values
// as well as the adjusted Delta.
double optionGreeksModel::calculateOptionPriceWithGammaVega(double underlyingPrice, double strikePrice,
                                                            double timeToExpiration, double riskFreeRate) 
                                                            const {
    // Calculate the Delta, Gamma, and Vega values.
    double delta = getDelta(), gamma = getGamma(), vega = getVega();

    // Calculate the Gamma- and Vega-adjusted Delta.
    double gammaVegaAdjustedDelta = getGammaVegaAdjustedDelta();
    
    // Calculate the option price using the pricing formula, incorporating the adjusted Delta, Gamma, Vega, 
    // and other parameters
    double optionPriceGammaVega = gammaVegaAdjustedDelta * underlyingPrice + 0.5 * gamma
                                    * (underlyingPrice * underlyingPrice)
                                    - vega * (underlyingPrice * sqrt(timeToExpiration)
                                    * exp(-riskFreeRate * timeToExpiration) / 100.0);

    setOptionPriceGammaVega(optionPriceGammaVega);
    
    return optionPriceGammaVega;
} // calculateOptionPriceWithGammaVega()


/*------------------------------------- INTERMEDIATE MEMBER FUNCTIONS  ----------------------------------------*/

// Calculates the adjusted Delta value, which is the Delta value adjusted by the IV value.
double optionGreeksModel::calculateDeltaAdjWithIV(double impliedVolatility) const {
    // Calculate d1 using the adjusted inputs.
    double d1 = calculateD1(underlyingPrice, strikePrice, timeToExpiration, riskFreeRate,
                            impliedVolatility);
    
    // Calculate the Delta value using the adjusted inputs.
    double ivAdjustedDelta = normalCDF(d1);
    
    setIvAdjustedDelta(ivAdjustedDelta);
    
    return ivAdjustedDelta;
}

// Calculates the adjusted Delta value, which is the Delta value adjusted by the Gamma value.
double optionGreeksModel::calculateDeltaAdjWithGamma() const {
    // Adjust the Delta based on the Gamma value
    double gammaAdjustedDelta = getDelta() + (0.5 * getGamma());
    
    // Set the adjusted Delta using the setAdjustedDelta function
    setGammaAdjustedDelta(gammaAdjustedDelta);
    
    // Return the adjusted delta
    return gammaAdjustedDelta;
} // calculateDeltaAdjWithGamma()


// Calculates the adjusted Delta value, which is the Delta value adjusted by the Vega value.
double optionGreeksModel::calculateDeltaAdjWithVega() const {
    double delta = getDelta(), vega = getVega();
    
    // Adjust the Delta based on the Vega value
    double vegaAdjustedDelta = delta + vega;
    
    // Set the Vega-adjusted Delta using the setVegaAdjustedDelta function
    setVegaAdjustedDelta(vegaAdjustedDelta);
    
    // Return the Vega-adjusted delta
    return vegaAdjustedDelta;
} // calculateDeltaAdjWithVega()


// Calculates the adjusted Delta value, which is the Delta value adjusted by the Theta value.
double optionGreeksModel::calculateDeltaAdjWithTheta() const {
    double delta = getDelta(), theta = getTheta();
    
    // Adjust the Delta based on the Theta value
    double thetaAdjustedDelta = delta - theta;
    
    // Set the Theta-adjusted Delta using the setThetaAdjustedDelta function
    setThetaAdjustedDelta(thetaAdjustedDelta);
    
    // Return the Theta-adjusted delta
    return thetaAdjustedDelta;
} // calculateDeltaAdjWithTheta()


// Calculates the adjusted Delta value, which is the Delta value adjusted by both
// its Gamma and Vega values.
double optionGreeksModel::calculateDeltaAdjWithGammaVega() const {
    // Calculate the Delta, Gamma, and Vega values
    double delta = getDelta(), gamma = getGamma(), vega = getVega();
    
    // Adjust the Delta based on the Gamma and Vega values
    double gammaVegaAdjustedDelta = delta + (0.5 * gamma) + vega;
    
    // Set the Vega- and Gamma-adjusted Delta using the setGammaVegaAdjustedDelta function
    setGammaVegaAdjustedDelta(gammaVegaAdjustedDelta);
    
    return gammaVegaAdjustedDelta;
} // calculateDeltaAdjWithGammaVega()


/*--------------------------------------------  SETTER METHODS  ------------------------------------------------*/

// Setter method for the IV-adjusted option price using the Black-Scholes model.
void optionGreeksModel::setOptionPriceIv(double optionPriceIv) const {
    optionPriceIv_ = optionPriceIv;
} // setOptionPriceIv()

// Setter method for the Gamma-adjusted option price using the Black-Scholes model.
void optionGreeksModel::setOptionPriceGamma(double optionPriceGamma) const {
    optionPriceGamma_ = optionPriceGamma;
} // setOptionPriceGamma()


// Setter method for the Vega-adjusted option price using the Black-Scholes model.
void optionGreeksModel::setOptionPriceVega(double optionPriceVega) const {
    optionPriceVega_ = optionPriceVega;
} // setOptionPriceVega()


// Setter method for the Theta-adjusted option price using the Black-Scholes model.
void optionGreeksModel::setOptionPriceTheta(double optionPriceTheta) const {
    optionPriceTheta_ = optionPriceTheta;
} // setOptionPriceTheta()


// Setter method for the Gamma- and Vega-adjusted option price using the Black-Scholes model.
void optionGreeksModel::setOptionPriceGammaVega(double optionPriceGammaVega) const {
    optionPriceGammaVega_ = optionPriceGammaVega;
} // setOptionPriceGammaVega()


// Setter method for the IV-adjusted Delta value of the Black-Scholes model.
void optionGreeksModel::setIvAdjustedDelta(double ivAdjustedDelta) const {
    ivAdjustedDelta_ = ivAdjustedDelta;
} // setIvAdjustedDelta()

// Setter method for the Gamma-adjusted Delta value of the Black-Scholes model.
void optionGreeksModel::setGammaAdjustedDelta(double gammaAdjustedDelta) const {
    gammaAdjustedDelta_ = gammaAdjustedDelta;
} // setGammaAdjustedDelta()


// Setter method for the Vega-adjusted Delta value of the Black-Scholes model.
void optionGreeksModel::setVegaAdjustedDelta(double vegaAdjustedDelta) const {
    vegaAdjustedDelta_ = vegaAdjustedDelta;
} // setVegaAdjustedDelta()

// Setter method for the Theta-adjusted Delta value of the Black-Scholes model.
void optionGreeksModel::setThetaAdjustedDelta(double thetaAdjustedDelta) const {
    thetaAdjustedDelta_ = thetaAdjustedDelta;
} // setThetaAdjustedDelta()


// Setter method for the Gamma- and Vega-adjusted Delta value of the Black-Scholes model.
void optionGreeksModel::setGammaVegaAdjustedDelta(double gammaVegaAdjustedDelta) const {
    gammaVegaAdjustedDelta_ = gammaVegaAdjustedDelta;
} // setGammaVegaAdjustedDelta()


/*------------------------------------------  GETTER METHODS  ------------------------------------------*/


// Getter method for the IV-adjusted option price using the Black-Scholes model.
const double& optionGreeksModel::getOptionPriceIv() const {
    return optionPriceIv_;
} // getOptionPriceIv()


// Getter method for the Gamma-adjusted option price using the Black-Scholes model.
const double& optionGreeksModel::getOptionPriceGamma() const {
    return optionPriceGamma_;
} // getOptionPriceGamma()


// Getter method for the Vega-adjusted option price using the Black-Scholes model.
const double& optionGreeksModel::getOptionPriceVega() const {
    return optionPriceVega_;
} // getOptionPriceVega()


// Getter method for the Theta-adjusted option price using the Black-Scholes model.
const double& optionGreeksModel::getOptionPriceTheta() const {
    return optionPriceTheta_;
} // getOptionPriceTheta()


// Getter method for the Gamma-adjusted option price using the Black-Scholes model.
const double& optionGreeksModel::getOptionPriceGammaVega() const {
    return optionPriceGammaVega_;
} // getOptionPriceGammaVega()


// Getter method for the IV-adjusted Delta value of option Greeks.
const double& optionGreeksModel::getIvAdjustedDelta() const {
    return ivAdjustedDelta_;
} // getIvAdjustedDelta()

// Getter method for the Gamma-adjusted Delta value of option Greeks.
const double& optionGreeksModel::getGammaAdjustedDelta() const {
    return gammaAdjustedDelta_;
} // getGammaAdjustedDelta()


// Getter method for the Vega-adjusted delta value of option Greeks.
const double& optionGreeksModel::getVegaAdjustedDelta() const {
    return vegaAdjustedDelta_;
} // getVegaAdjustedDelta()


// Getter method for the Theta-adjusted delta value of option Greeks.
const double& optionGreeksModel::getThetaAdjustedDelta() const {
    return thetaAdjustedDelta_;
} // getThetaAdjustedDelta()



// Getter method for the Gamma- and Vega-adjusted delta value of option Greeks.
const double& optionGreeksModel::getGammaVegaAdjustedDelta() const {
    return gammaVegaAdjustedDelta_;
} // getGammaVegaAdjustedDelta()
