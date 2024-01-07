//
//  optionGreeksModel.h
//  black-scholes
//
//  Created by lyndskg on 7/18/23.


#ifndef OPTIONGREEKSMODEL_H
#define OPTIONGREEKSMODEL_H

#include <stdio.h>

#include "blackScholesModel.h"
#include "optionGreeks.h"

using namespace std;

class optionGreeksModel : public virtual blackScholesModel, public optionGreeks {
  public:
// ----------------------------------------------------------------------------
//                 "optionGreeksModel" Class Declarations
// ----------------------------------------------------------------------------
/*------------------------------  CONSTRUCTORS  ------------------------------*/

    // Default constructor.
    optionGreeksModel();
    
    // Custom constructor.
    optionGreeksModel(double underlyingPrice, double strikePrice, double timeToExpiration,
                      double riskFreeRate, double volatility);


/*------------------------------- KEY MEMBER FUNCTIONS  -----------------------------*/
    
    // Calculates the number of shares needed to maintain a delta-neutral position -- determining
    // the appropriate action (i.e. buy or sell) and executing the corresponding order.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    void performDeltaNeutralHedging(double hedgeRatio);
    
    
    // Calculates the option price taking implied volatility (IV) as an additional input
    // parameter used to re-calculate the Delta value.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    double calculateOptionPriceWithIV(double underlyingPrice, double strikePrice,
                                      double timeToMaturity, double riskFreeRate,
                                      double impliedVolatility) const;
    
    
    // Calculates the option price with Gamma adjustments, incorporating Delta and Gamma values
    // as well as the adjusted Delta.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    double calculateOptionPriceWithGamma(double underlyingPrice, double strikePrice,
                                         double timeToMaturity, double riskFreeRate) const;
    
    
    // Calculates the option price with Vega adjustments, incorporating Delta and Gamma values
    // as well as the adjusted Delta.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    double calculateOptionPriceWithVega(double underlyingPrice, double strikePrice,
                                        double timeToMaturity, double riskFreeRate) const;
    
    
    // Calculates the option price with Theta adjustments, incorporating Delta and Theta values
    // as well as the adjusted Delta.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    double calculateOptionPriceWithTheta(double underlyingPrice, double strikePrice,
                                        double timeToMaturity, double riskFreeRate) const;
    
    
    // Calculates the option price with both Gamma and Vega adjustments, incorporating Delta and Gamma values as well as the adjusted Delta.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    double calculateOptionPriceWithGammaVega(double underlyingPrice, double strikePrice,
                                             double timeToMaturity, double riskFreeRate) const;


/*-------------------------- INTERMEDIATE MEMBER FUNCTIONS  -------------------------*/
    
    
    // Calculates a new Delta value based on 'd1' using implied volatility as an additional
    // input parameter.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    double calculateDeltaAdjWithIV(double impliedVolatility) const;
    
    
    // Calculates the adjusted Delta value, which is the Delta value adjusted by its Gamma value.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    double calculateDeltaAdjWithGamma() const;
    
    // Calculates the adjusted Delta value, which is the Delta value adjusted by its Vega value.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    double calculateDeltaAdjWithVega() const;
    
    
    // Calculates the adjusted Delta value, which is the Delta value adjusted by the Theta value.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    double calculateDeltaAdjWithTheta() const;
    
    
    // Calculates the adjusted Delta value, which is the Delta value adjusted by both
    // its Gamma and Vega values.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    double calculateDeltaAdjWithGammaVega() const;
    
    
/*--------------------------  SETTER METHODS  --------------------------*/
    
    // Setter method for the IV-adjusted option price using the Black-Scholes model.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    void setOptionPriceIv(double optionPriceIv) const;
        
    // Setter method for the Gamma-adjusted option price using the Black-Scholes model.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    void setOptionPriceGamma(double optionPriceGamma) const;

    
    // Setter method for the Vega-adjusted option price using the Black-Scholes model.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    void setOptionPriceVega(double optionPriceVega) const;
    
    
    // Setter method for the Theta-adjusted option price using the Black-Scholes model.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    void setOptionPriceTheta(double optionPriceTheta) const;
    
    
    // Setter method for the Theta-adjusted Delta value of the Black-Scholes model.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    void setThetaAdjustedDelta(double thetaAdjustedDelta) const;

    
    // Setter method for the Gamma- and Vega-adjusted option price using the Black-Scholes model.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    void setOptionPriceGammaVega(double optionPriceGammaVega) const;
    
    
    // Setter method for the IV-adjusted Delta value of the Black-Scholes model.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    void setIvAdjustedDelta(double ivAdjustedDelta) const;
    
    
    // Setter method for the Gamma-adjusted Delta value of the Black-Scholes model.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    void setGammaAdjustedDelta(double gammaAdjustedDelta) const;
    
    
    // Setter method for the Vega-adjusted Delta value of the Black-Scholes model.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    void setVegaAdjustedDelta(double vegaAdjustedDelta) const;
    
    
    // Setter method for the Gamma- and Vega-adjusted Delta value of the Black-Scholes model.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    void setGammaVegaAdjustedDelta(double gammaVegaAdjustedDelta) const;
    

    
/*--------------------------  GETTER METHODS  --------------------------*/
    
    // Getter method for the IV-adjusted option price using the Black-Scholes model.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    const double& getOptionPriceIv() const;
        
    // Getter method for the Gamma-adjusted option price using the Black-Scholes model.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    const double& getOptionPriceGamma() const;
    
    
    // Getter method for the Vega-adjusted option price using the Black-Scholes model.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    const double& getOptionPriceVega() const;
    
    
    // Getter method for the Theta-adjusted option price using the Black-Scholes model.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    const double& getOptionPriceTheta() const;
    
    
    // Getter method for the Gamma- and Vega-adjusted option price using the Black-Scholes model.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    const double& getOptionPriceGammaVega() const;
    
    
    // Getter method for the IV-adjusted Delta value of option Greeks.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    const double& getIvAdjustedDelta() const;
    
    
    // Getter method for the Gamma-adjusted Delta value of option Greeks.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    const double& getGammaAdjustedDelta() const;
    
    
    // Getter method for the Vega-adjusted Delta value of option Greeks.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    const double& getVegaAdjustedDelta() const;
    
    
    // Getter method for the Theta-adjusted delta value of option Greeks.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    const double& getThetaAdjustedDelta() const;
        
    
    
    // Getter method for the Gamma- and Vega-adjusted Delta value of option Greeks.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    const double& getGammaVegaAdjustedDelta() const;
    
    
protected:
    // TODO: Implement protected class member variables.
    
private:
// ----------------------------------------------------------------------------
//                  "optionGreeks" Member Variables
// ----------------------------------------------------------------------------
//*------------------ adjusted option Greeks variables  --------------------*//
    mutable double ivAdjustedDelta_;
    mutable double gammaAdjustedDelta_;
    mutable double vegaAdjustedDelta_;
    mutable double thetaAdjustedDelta_;
    mutable double gammaVegaAdjustedDelta_;
    
    mutable double optionPriceIv_;
    mutable double optionPriceGamma_;
    mutable double optionPriceVega_;
    mutable double optionPriceTheta_;
    mutable double optionPriceGammaVega_;
    
    
}; // class optionGreeksModel

#endif /* OPTIONGREEKSMODEL_H */
