//
//  main.cpp
//  black-scholes
//
//  Created by lyndskg on 7/18/23.

#include <iomanip>
#include <limits>

#include "Program.h"
#include "inputReader.h"
#include "blackScholesModel.h"
#include "optionGreeks.h"
#include "optionGreeksModel.h"

#include "xcode_redirect.hpp"

using namespace std;

// ----------------------------------------------------------------------------
//                              Program Driver
// ----------------------------------------------------------------------------

constexpr int MAX_BUFFER_SIZE = 10000; // Choose an appropriately large value.


int main(int argc, char* argv[]) {
    // To speed up I/O
    ios_base::sync_with_stdio(false);
    xcode_redirect(argc, argv);
    
    // Set the precision for decimal places.
    cout << setprecision(20);  // Always show 20 decimal places
    cout << fixed; // Disable scientific notation for large numbers
    
    int iter = 1; // Track # of times algo has been run.
    
    
    // Create an instance of the Program.
    Program program;
    program.get_options(argc, argv);
    
    char choice;
    const string prompt = "Do you want to continue playing with the algorithm? (Y/N): ";
    
    // Main loop to run the algorithm as many times as user desires.
    do {
        // Reinitialize input mode based on user's specifications.
        program.inputMode = program.readInputMode();
        
        // Create a new instance of the blackScholesModel for each new run.
        blackScholesModel model;
        program.launchAlgo(&model);

        // Calculate the option price using the input values.
        double optionPrice = model.calculateOptionPrice();
        
        // Display the calculated option price.
        cout << "Calculated option price: " << optionPrice << endl;
        
        // Loop until the user provides a valid choice.
        while (true) {
            cout << prompt;
            cin >> choice;
            
            // Ignore any remaining characters in the input buffer.
            cin.ignore(MAX_BUFFER_SIZE, '\n');
            
            // Check if the user's input is a valid choice.
            if (choice == 'Y' || choice == 'y' || choice == 'N' || choice == 'n') {
                break; // Exit the loop and end the program.
            } // if
            
            // Display error message for invalid choice.
            cout << "Invalid choice. Please enter either Y/y or N/n.\n";
            
            iter++; // Increment count variable.
        } // while
        
    } while (choice == 'Y' || choice == 'y'); // do-while
    
    // Display goodbye message.
    cout << "Algorithm was ran " << iter << " times.\n";
    cout << "Exiting the program. Goodbye!\n";
    
    
    return 0; // Exit the program successfully.
    
} // main()
