//
//  optionGreeks.h
//  black-scholes
//
//  Created by lyndskg on 7/18/23.

#ifndef optionGreeks_h
#define optionGreeks_h

#include <stdio.h>
#include <cmath>

#include "blackScholesModel.h"

// -----------------------------------------------------------------------------------
//                       "optionGreeks" Class Declarations
// -----------------------------------------------------------------------------------

                            /* DERIVED CLASS */
class optionGreeks : public virtual blackScholesModel {
  public:
/*-----------------------------------  CONSTRUCTORS  --------------------------------*/
    // Default constructor.
    optionGreeks();

    // Custom constructor.
    optionGreeks(double underlyingPrice, double strikePrice, double timeToExpiration,
                 double riskFreeRate, double volatility);

/*--------------------------------  KEY MEMBER FUNCTIONS  ----------------------------*/

    // Delta measures the change in option price for a unit change in
    // the underlying asset price.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    double calculateDelta() const;


    // Gamma measures the rate of change of Delta concerning changes in
    // the underlying asset price.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    double calculateGamma() const;


    // Theta measures the rate of time decay of an option's value.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    double calculateTheta() const;


    // Vega measures the sensitivity of an option's price to changes
    // in implied volatility.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    double calculateVega() const;


    // Rho measures the sensitivity of an option's price to changes in the
    // risk-free interest rate.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    double calculateRho() const;

    // TODO: Implement more member functions for calculating/accessing option Greeks



/*---------------------------------  SETTER METHODS  ---------------------------------*/

    // Setter method for the Delta value of option Greeks.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    void setDelta(const double& value) const;


    // Setter method for the Gamma value of option Greeks.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    void setGamma(const double& value) const;


    // Setter method for the Vega value of option Greeks.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    void setVega(const double& value) const;


    // Setter method for the Theta value of option Greeks.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    void setTheta(const double& value) const;


    // Setter method for the Rho value of option Greeks.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    void setRho(const double& value) const;



/*----------------------------------  GETTER METHODS  -----------------------------------*/

    // Getter method for the Delta value of option Greeks.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    const double& getDelta() const;


    // Getter method for the Gamma value of option Greeks.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    const double& getGamma() const;


    // Getter method for the Vega value of option Greeks.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    const double& getVega() const;


    // Getter method for the Theta value of option Greeks.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    const double& getTheta() const;


    // Getter method for the Rho value of option Greeks.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    const double& getRho() const;


  protected:
// -------------------------------------------------------------------------------------
//                            "optionGreeks" Member Variables
// -------------------------------------------------------------------------------------
    mutable double delta_;
    mutable double gamma_;
    mutable double vega_;
    mutable double theta_;
    mutable double rho_;

  private:
    // Private member variables and helper functions

}; // class optionGreeks

#endif /* optionGreeks_h */
