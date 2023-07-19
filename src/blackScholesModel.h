//
//  blackScholesModel.h
//  black-scholes
//
//  Created by lyndskg on 7/12/23.

#ifndef blackscholesmodel_h
#define blackscholesmodel_h

#include <stdio.h>
#include <algorithm>

using namespace std;


// ----------------------------------------------------------------------------
//                  "blackScholesModel" Class Declarations
// ----------------------------------------------------------------------------

class blackScholesModel {
  public:
/*------------------------------  CONSTRUCTORS  ------------------------------*/
    
    // Default constructor.
    blackScholesModel();
  
    
    // Custom constructor for optionGreeks derived class.
    blackScholesModel(double underlyingPrice, double strikePrice, double timeToExpiration,
                      double riskFreeRate, double volatility);
    
    
    // Custom constructor for general usage.
    //
    // Initializes all member functions used in the pricing formula via getter methods.
    blackScholesModel(double underlyingPrice, double strikePrice, double riskFreeRate,
                      double timeToExpiration, double volatility, char optionType);
    
    
/*------------------------------ KEY MEMBER FUNCTIONS  ------------------------------*/
    
    /* Defines the option pricing function and calculates the option price using the
       Black-Scholes formula.
       The function takes in the underlying price, strike price, time to expiration, risk-free rate,
       volatility, and option type as input parameters and returns the calculated option price. */
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    double calculateOptionPrice();
    
    
    /* Approximates the cumulative distribution function (CDF) of a normal distribution.
       The function calculates an approximation of the CDF of a standard normal distribution
       given a double value 'd' as input. */
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    double normalCDF(double d) const;


/*--------------------------------  SETTER METHODS  --------------------------------*/

    // Setter method for the underlying price of the Black-Scholes model.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    void setUnderlyingPrice(const double& value);
    
    
    // Setter method for the strike price of the Black-Scholes model.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    void setStrikePrice(const double& value);
    
    
    // Setter method for the time until expiration of the Black-Scholes model.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    void setTTE(const double& value);
    
    
    // Setter method for the risk-free rate of the Black-Scholes model.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    void setRFR(const double& value);
    
    
    // Setter method for the volatility of the Black-Scholes model.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    void setVolatility(const double& value);
    
    
    // Setter method for the option type of the Black-Scholes model.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    void setOptionType(const char& value);
    
    
    // Setter method for intermediate variable 'd1' of the Black-Scholes model.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    void setD1(const double& value) const;
    
    
    // Setter method for intermediate variable 'd2' of the Black-Scholes model.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    void setD2(const double& value) const;
    
    
    // Setter method for intermediate variable 'K' of the Black-Scholes model.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    void setK(const double& value) const;
    
    
/*--------------------------------  GETTER METHODS  --------------------------------*/

    // Getter method for the underlying price of the Black-Scholes model.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    const double& getUnderlyingPrice() const;
    
    
    // Getter method for the strike price of the Black-Scholes model.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    const double& getStrikePrice() const;
    
    
    // Getter method for the time until expiration of the Black-Scholes model.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    const double& getTTE() const;
    
    
    // Getter method for the risk-free rate of the Black-Scholes model.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    const double& getRFR() const;

    
    // Getter method for the volatility of the Black-Scholes model.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    const double& getVolatility() const;
  
    
    // Getter method for the option type of the Black-Scholes model.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    const char& getOptionType() const;
    
    
    // Getter method for the intermediate variable d1 of the Black-Scholes model.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    const double& getD1() const;
    
    
    // Getter method for the intermediate variable d2 of the Black-Scholes model.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    const double& getD2() const;
    
    
    // Getter method for the intermediate variable K of the Black-Scholes model.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    const double& getK() const;
    

  // Accessible by derived classes:
  protected:
/*------------------------------  HELPER FUNCTIONS  -------------------------------*/
        
    // Calculates the intermediate variable 'd1'.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    double calculateD1(double underlyingPrice, double strikePrice, double timeToExpiration, double riskFreeRate, double volatility) const;
    
    
    // Calculates the intermediate variable 'd2'.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    double calculateD2(double underlyingPrice, double strikePrice, double timeToExpiration, double riskFreeRate, double volatility) const;
    

    // Calculates the intermediate variable 'K'.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    double calculateK(double d) const;
    
    
// ----------------------------------------------------------------------------
//                  "blackScholesModel" Member Variables
// ----------------------------------------------------------------------------
//*--Variables used directly as input values in the Black-Scholes formula.--*//
    double underlyingPrice;
    double strikePrice;
    double timeToExpiration;
    double riskFreeRate;
    double volatility;
    char optionType;
    
    //    enum OptionContractType {
    //        Call = 1,
    //        Put = 2
    //    };
    
//*------------- Intermediate variables in pricing functions. ---------------*//
    mutable double d1_;
    mutable double d2_;
    
    mutable double d_;
    
    mutable double K_; // For normalCDF() calculations.
    
}; // class blackScholesModel

#endif /* blackScholesModel_h */
