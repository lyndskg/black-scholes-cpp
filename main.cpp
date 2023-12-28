//
//  main.cpp
//  black-scholes
//
//  Created by lyndskg on 7/18/23.

#include <iomanip>
#include <limits>
#include <iostream>

#include "include/black-scholes-cpp/Program.h"
#include "include/black-scholes-cpp/inputReader.h"
#include "include/black-scholes-cpp/blackScholesModel.h"
#include "include/black-scholes-cpp/optionGreeks.h"
#include "include/black-scholes-cpp/optionGreeksModel.h"

#include "xcode_redirect.hpp"

using namespace std;

// ----------------------------------------------------------------------------
//                              Program Driver
// ----------------------------------------------------------------------------

int main(int argc, char* argv[]) {
    // Call the fast_io function to speed up I/O.
    fast_io();

    constexpr int MAX_BUFFER_SIZE = 10000; // Choose an appropriately large value.

    // To further speed up I/O.
    ios_base::sync_with_stdio(false);
    xcode_redirect(argc, argv);
    
    // Set the precision for decimal places.
    cout << setprecision(20);  // Always show 20 decimal places
    cout << fixed; // Disable scientific notation for large numbers
    
    char choice;
    const string prompt = "Do you want to continue playing with the algorithm? (Y/N): ";

    // Create an instance of the Program.
    Program program;
    program.get_options(argc, argv);
    
    // Main loop to run the algorithm as many times as user desires.
    bool terminateProgram = false;
    int iter = 1; // Track # of times algo has been run.
    while (!terminateProgram) {
        // Reinitialize input mode based on user's specifications.
        program.inputMode = program.readInputMode();
        
        // Create a new instance of the blackScholesModel for each new run.
        blackScholesModel model;
        program.launchAlgo(&model);

        // Calculate the option price using the input values.
        double optionPrice = model.calculateOptionPrice();
        
        // Display the calculated option price.
        cout << "Calculated option price: " << optionPrice << '\n';
        
        // Loop until the user provides a valid choice.
        while (true) {
            cout << prompt;
            cin >> choice;
            
            // Ignore any remaining characters in the input buffer.
            cin.ignore(MAX_BUFFER_SIZE, '\n');
            
            if (choice == 'Y' || choice == 'y') {
                break; // Continue to main loop
            } else if (choice == 'N' || choice == 'n') {
                terminateProgram = true; // Set the flag to terminate the program
                break;
            } // if
            
            // Display error message for invalid choice.
            cerr << "Invalid choice. Please enter either Y/y or N/n.\n";
        } // while
        
        iter++; // Increment count variable.
    
    } // while
    
    if (terminateProgram) {
        // Display goodbye message.
        cout << "Algorithm was ran " << iter << " times.\n";
        cout << "Exiting the program. Goodbye!\n";
    } // if 
    
    return 0; // Exit the program successfully.
    
} // main()
