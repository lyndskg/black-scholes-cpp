//
//  outputWriter.h
//  black-scholes
//
//  Created by lyndskg on 7/19/23.
//

#ifndef outputWriter_h
#define outputWriter_h

#include <stdio.h>
#include <iostream>
#include <fstream>
#include <string>

using namespace std;

class outputWriter {
// ----------------------------------------------------------------------------
//                  "outputWriter" Class Declarations
// ----------------------------------------------------------------------------
public:
/*------------------------------  CONSTRUCTORS  ------------------------------*/
    // Default constructor.
    outputWriter();
    
    // Default destructor.
    ~outputWriter();
    
    void writeToConsole(const string& data);
    
    void writeToFile(const string& filename, const string& data);

    
private:
// ----------------------------------------------------------------------------
//                  "outputWriter" Member Variables
// ----------------------------------------------------------------------------
};

#endif /* outputWriter_h */
