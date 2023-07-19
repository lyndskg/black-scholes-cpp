//
//  inputReader.h
//  black-scholes
//
//  Created by lyndskg on 7/18/23.
//

#ifndef inputReader_h
#define inputReader_h

#include <string>

#include <curl/curl.h>
#include "csv.h"
#include "blackScholesModel.h"

using namespace std;

class blackScholesModel; // Forward declaration of blackScholesModel class

// ----------------------------------------------------------------------------
//                  "inputReader" Class Declarations
// ----------------------------------------------------------------------------

class inputReader {
  private:
/*-------- HELPER FUNCTION VARIABLES (readDoubleInput, readOptionType) -----------*/
    string input;
    bool validInput;
    int i; 
    
/*------------------------------  HELPER FUNCTIONS  -------------------------------*/
    
    /* Reads a double input value from the user with validation.
       It prompts the user with the provided prompt string and reads a line of input.
       It attempts to convert the input to a double value using stod().
       If the conversion is successful and there are no trailing characters after the number,
       the function returns the validated double value.
       If the input is invalid, it displays an error message and prompts the user
       to enter a valid number. */
    //
    // @param prompt: The prompt string displayed to the user.
    // @return: The validated double value entered by the user.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    double readDoubleInput(const string& prompt);

    
    /* Reads an option type input from the user with validation.
       Prompts the user to enter an option type (either 'C' or 'P') and validates the input.
       It ensures that the input is a single character and is either 'C' or 'P' (case-insensitive).
       The function keeps prompting the user until a valid option type is entered. */
    //
    // @param prompt: The prompt message to display for the user
    // @return: The validated option type entered by the user, represented as a char ('C' or 'P').
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    char readOptionType(const string& prompt);
    
    
    // Validates and sets the input values for the blackScholesModel.
    //
    // Time complexity: O(1)
    // Space complexity: O(1)
    bool validateAndSetInputValues(blackScholesModel& model, double underlyingPrice, double strikePrice,
                                   double timeToExpiration, double riskFreeRate, double volatility, char optionType);
    
    
  public:
/*------------------------------ CONSTRUCTORS  -------------------------------*/
    
    // Default constructor.
    inputReader();
  
    
/*------------------------ KEY MEMBER FUNCTIONS  -----------------------------*/
   
    // Reads input values from the user interactively.
    //
    // Time complexity: O(1) per input prompt
    //          i.e. time complexity depends on the number of input prompts
    //               and the time it takes for the user to provide valid input.
    // Space complexity: O(1)
    //
    // TODO: Use validateAndSetInputValues()? 
    void readInputFromUser(blackScholesModel& model);
    
    
    // Reads input parameters from a file (e.g. JSON or CSV).
    //
    // Time complexity: O(1) per input read from the file
    // Space complexity: O(1)
    void readInputFromFile(blackScholesModel& model, const string& filename);
    
    
    /* Reads input values from a database.
       It connects to the database, retrieves the input data, validates the
       retrieved values, and sets them in the blackScholesModel object. */
    //
    // Time complexity: O(1) [per input retrieval from the database]
    // Space complexity: O(1)
    //
    // TODO: IMPLEMENT
    void readInputFromDB(blackScholesModel& model);
    
    
    /* Reads input values from an API by making an HTTP request.
       It initializes libcurl, sets up the HTTP request w/ the API endpoint URL,
       and performs the request. The received response is stored in the 'response' string
       and then parsed to extract the input values. Finally, the retrieved input values
       are validated and set in the blackScholesModel object. */
    //
    // Time complexity: O(1) [per input retrieval from the API]
    // Space complexity: O(1)
    //
    // TODO: IMPLEMENT
    void readInputFromAPI(blackScholesModel& model);
    
}; // class InputReader


#endif /* inputReader_h */
