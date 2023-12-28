//
//  outputWriter.cpp
//  black-scholes
//
//  Created by lyndskg on 7/19/23.

#include <iostream>
#include <fstream>

#include "../include/black-scholes-cpp/outputWriter.h"

using namespace std;


// Include the declaration of the fast_io function
extern void fast_io();

// ----------------------------------------------------------------------------
//            "outputWrite" Class Member Function Implementations
// ----------------------------------------------------------------------------

// Default constructor.
outputWriter::outputWriter() {
    // Call fast_io to optimize I/O speed
    fast_io();
} // outputWriter()


// Default destructor.
outputWriter::~outputWriter() {}


void outputWriter::writeToConsole(const string& data) {
    cout << data;
} // writeToConsole()



void outputWriter::writeToFile(const string& filename, const string& data) {
    ofstream outputFile(filename);
    
    // If the file is able to be opened:
    if (outputFile.is_open()) {
        outputFile << data;
        outputFile.close();
        
        cout << "Data written to file: " << filename << '\n';
        
    // If the file is unable to be opened:
    } else {
        cerr << "Error: Unable to open file for writing: " << filename << '\n';
    } // if-else
} // writeToFile()
