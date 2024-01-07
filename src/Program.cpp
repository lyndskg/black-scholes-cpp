//
//  Program.cpp
//  black-scholes
//
//  Created by lyndskg on 7/17/23.

#include <iostream>
#include <getopt.h>

#include "../include/black-scholes-cpp/Program.h"
#include "../include/black-scholes-cpp/inputReader.h"
#include "../include/black-scholes-cpp/blackScholesModel.h"

using namespace std;

// Define the fast_io lambda function
void fast_io_initializer() {
    ios_base::sync_with_stdio(false);
    cin.tie(nullptr);
} // fast_io_initializer()

// Initialize the fast_io variable as a function pointer
void (*fast_io)() = fast_io_initializer;

// --------------------------------------------------------------------------------------------------
//                         "Program" Class Member Function Implementations
// --------------------------------------------------------------------------------------------------

/*-----------------------------------------  CONSTRUCTORS  -----------------------------------------*/

// Default constructor.
Program::Program() : inputMode("") {
    // To speed up I/O
    static auto fast_io = []() {
        ios_base::sync_with_stdio(false);
        cin.tie(nullptr);
        return nullptr;
    }();
}


/*-------------------------------------- KEY MEMBER FUNCTIONS  --------------------------------------*/

// Processes the command line arguments.
void Program::get_options(int argc, char* argv[]) {
    int optIndex = 0, option = 0;
    bool invalidMode = false; // Tracks invalid mode provision(s)
    
    // Define an array of the structures describing each long option.
    struct option longOpts[] = {{"mode", required_argument, nullptr, 'm'}, // Option: --mode or -m
                                {"help", no_argument, nullptr, 'h'},       // Option: --help or -h
                                {nullptr, no_argument, nullptr, '\0'}};    // End of options
    
    // Loop over all options.
    while ((option = getopt_long(argc, argv, "m:h", longOpts, &optIndex)) != -1) {
        switch (option) {
            // If the "mode" option is flagged:
            case 'm':
                inputMode = optarg; // Set the program mode to the provided argument.
                
                // Check if an invalid mode is specified:
                if (inputMode != "USER" && inputMode != "FILE"
                                        && inputMode != "DB" && inputMode != "API") {
                    cerr << "Invalid mode \"" + inputMode + "\""; // Print to standard error.
                    invalidMode = true; // Set invalidMode to true.
                } // if
                break; // Break out of the switch statement.
                
            // If the "help" option is flagged:
            case 'h':
                printHelp(argv); // Print a helpful message.
                exit(0); // Exit.
            
            // Default case:
            default:
                cerr << "Invalid command line option \"" << option << "\""; // TODO: fix
                invalidMode = true; // Set invalidMode to true.
                break; // Break out of the switch statement.
        } // switch
    } // while
    
    // Check if an invalid mode was encountered:
    if (invalidMode) {
        cerr << " was provided as a command line option.\n";
        exit(1); // Exit with an error code
    } // if
    
    // Check if a mode was specified:
    if (inputMode.empty()) {
        cerr << "Error: no mode specified.\n";
        cerr << "Please re-run the program with your input mode of choice.\n";
        exit(1); // Exit with an error code
    } // if
} // get_options()


// Prints a helpful message about how to use the program for the user when requested.
void Program::printHelp(char* argv[]) {
    // Usage (HINT: 'argv[0]' is the name of the currently executing program):
    cout << "Usage: " << argv[0] << " [-m USER|FILE|DB|API]|-h\n";
    cout << "This program is designed to calculate European options pricing\n";
    cout << " using the Black-Scholes formula.\n";
    // Command-Line Options:
    cout << "Options:\n";
    cout << "-m, --mode <mode>: Specify the mode of operation.\n";
    cout << "Valid modes are: USER, FILE, DB, API.\n";
    cout << "-h, --help: Print this help message.\n";
    // Additional details and specifications:
    cout << "Based on the specified mode of operation, the program can read input \n";
    cout << "from its user(s), file(s), database(s), or external datafeed(s)/API(s).\n";
} // printHelp()
 

// Launches the algorithm by reading input values based on the specified input mode.
void Program::launchAlgo(blackScholesModel* model) {
    // Instantiate a new inputReader class.
    inputReader inputReader;
    
    // Call the corresponding function based on the input mode.

    // User input:
    if (inputMode == "USER") {
        inputReader.readInputFromUser(*model);
    } // if 
        
    // File input:
    else if (inputMode == "FILE") {
        string filename = "option_GS_df.csv";
        inputReader.readInputFromFile(*model, filename);
    } // elif
        
    // Database input:
    else if (inputMode == "DB") {
        inputReader.readInputFromDB(*model);
    } // elif
        
    // External data feed (e.g. API) input:
    else if (inputMode == "API") {
        inputReader.readInputFromAPI(*model);
    } // ...-elif
    
    cerr << "Error: invalid or non-existing mode.\n"; // Display error message.
    exit(-1); // Terminate program with error code.

} // launchAlgo()


// Reads and validates the input mode from the user.
string Program::readInputMode() {
    while (true) {
        cout << "Enter input mode (USER, FILE, DB, API): \n";
        cin >> inputMode;

        // Convert inputMode to uppercase for case-insensitive comparison.
        transform(inputMode.begin(), inputMode.end(), inputMode.begin(), ::toupper);

        // If input is valid:
        if (inputMode == "USER" || inputMode == "FILE" ||
            inputMode == "DB" || inputMode == "API") {
            return inputMode; // inputMode is valid
        // If input is invalid:
        } else {
            cout << "Invalid input mode. Please try again.\n"; // Display error message.
            
            cin.clear(); // Clear the input buffer.
            cin.ignore(MAX_BUFFER_SIZE, '\n');
        } // if-else
    } // while
} // readInputMode()
