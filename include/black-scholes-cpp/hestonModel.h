//
//  hestonModel.h
//  black-scholes
//
//  Created by lyndskg on 7/18/23.


#ifndef hestonModel_h
#define hestonModel_h

#include <stdio.h>
#include <cassert>

#include "blackScholesModel.h"
#include "optionGreeksModel.h"

using namespace std;

class hestonModel : public optionGreeksModel {
public:
// ----------------------------------------------------------------------------
//                       "hestonModel" Class Declarations
// ----------------------------------------------------------------------------
/*------------------------------  CONSTRUCTORS  ------------------------------*/
    hestonModel();
    
    hestonModel(double underlyingPrice, double strikePrice, double riskFreeRate,
                    double timeToExpiration, double volatility, double V0, double kappa,
                    double theta, double sigma, double rho, OptionType optionType);
   
/*--------------------------- KEY MEMBER FUNCTIONS  ---------------------------*/
    /* Calculates the option price using the Heston model with stochastic volatility.
       It uses Euler discretization to approximate the variance process over time,
       and then calculates the option price based on the type of option (call or put)
       using the Black-Scholes formula with Heston volatility.*/
    //
    // Time complexity: O(num_time_steps)
    // Space complexity: O(1)
    double calculateOptionPrice();

    
    // Function to generate a random number from a standard normal distribution
    double random_normal();

    
/*----------------------------  SETTER METHODS  ----------------------------*/
    
    // Setter method for V0.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    void setV0(double value) const;
    
    
    // Setter method for Kappa.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    void setKappa(double value) const;
    
    
    // Setter method for Theta.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    void setTheta(double value) const;
    
    
    // Setter method for Sigma.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    void setSigma(double value) const;
    
    
    // Setter method for Rho.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    void setRho(double value) const;

    
/*----------------------------  GETTER METHODS  ----------------------------*/
    // Getter method for V0.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    const double& getV0() const;
    
    
    // Getter method for Kappa.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    const double& getKappa() const;
    
    
    // Getter method for Theta.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    const double& getTheta() const;
    
    
    // Getter method for Sigma.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    const double& getSigma() const;
    
    
    // Getter method for Rho.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    const double& getRho() const;

private:
// ----------------------------------------------------------------------------
//                  "hestonModel" Member Variables
// ----------------------------------------------------------------------------
    // Heston Model Parameters
    mutable double V0_;    // Initial volatility
    mutable double kappa_; // Mean reversion speed
    mutable double theta_; // Long-term mean volatility
    mutable double sigma_; // Volatility of volatility
    mutable double rho_;   // Correlation between asset price and volatility
    
    const int num_time_steps = 252; // Number of time steps (assuming daily time steps)

}; // class hestonModel

#endif /* hestonModel_h */
