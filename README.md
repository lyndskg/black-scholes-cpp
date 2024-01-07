<a name="bs"></a>

<h1 align="center">black-scholes-cpp</h1>

<h4 align="center"><ins><strong><em>* a C++ program that calculates the price of European options using the Black-Scholes formula * </em></strong></ins></h4>

## SIDE-NOTE: IS BACKTESTING THAT BIG OF A DEAL IN THE FUTURE?

Figure out fast_io shit

<p align="center">
  <a href="https://www.linkedin.com/in/lyndsey791/">LinkedIn</a>  |  <a href="https://www.sorry-this-site-doesnt-exist-yet./">Website</a>  |     <a href="https://github.com/lyndskg/">GitHub</a>  |  <a href="#contact">Contact Info</a>
</p>

### <ins>Table of Contents</ins>
-
  <details>
    <summary><strong><em>I: Overview & Features</em></strong></summary>
    <ol>
      <li>
        <a href="#view">Project Overview</a>
        <ul>
          <li><a href="#feat">Key Features</a></li>
          <li><a href="#curr">Current Notes and Issues</a></li>
        </ul>
      </li>
      <li><a href="#tech">Currently Used Tech Stack</a></li>
      <li><a href="devenv">Development Environment</a></li>
      <li><a href="#uiux">UI/UX Implementation Details</a></li>
      <li><a href="io">Potential I/O Specifications</a>
      <li><a href="#err">Error Handling</a></li>
      <li><a href="#plus">Future Enhancements</a></li>
      <li><a href="bye">Conclusion</a></li>
    </ol>
  </details>
-
  <details>
    <summary><strong><em>II: Implementation Details</em></strong></summary>
    <ol>
      <li><a href="#tech">Technologies and Programming Languages</a></li>
      <li><a href="devenv">Development Environment</a></li>
      <li>
        <a href="#map">Roadmap</a>
        <ul>
          <li><a href="todo">To-Do List</a></li>
          <li><a href="est">Time Estimate</a></li>
        </ul> 
      </li>
      <li><a href="#uiux">UI/UX Implementation Details</a></li>
      <li><a href="#feat">Key Features</a></li>
      <li><a href="web">Web Application</a></li>
      <li><a href="#flow">Basic Workflow Guide</a></li>
      <li><a href="#impl">Project Implementation Guide</a></li>
      <li>
        <a href="io">Potential I/O Specifications</a>
        <ul>
          <li><a href="#i">Input</a></li>
          <li><a href="#o">Output</a></li>
          <li><a href="#err">Error Handling</a></li>
        </ul>
      </li>
      <li><a href="#plus">Future Enhancements</a></li>
    </ol>
  </details>
-
  <details>
    <summary><strong><em>III: Usage, Installation & Getting Started</em></strong></summary>
    <ol>
      <li>
        <a href="#view">Project Overview</a>
        <ul>
          <li><a href="#obj">Objectives</a></li>
        </ul>
      </li>
      <li><a href="#feat">Key Features</a></li>
      <li><a href="io">Potential I/O Specifications</a>
      <li><a href="#err">Error Handling</a></li>
      <li><a href="#install">Installation</a>
        <ul>
          <li><a href="#prereq">Prerequisites</a></li>
          <li><a href="buildnrun">Build and Run</a></li>
        </ul>
      </li>
      <li><a href="usage">Usage</a></li>
      <li><a href="#sys">System Requirements</a></li>
    </ol>
  </details>
-
  <details>
    <summary><strong><em>IV: Miscellaneous</em></strong></summary>
    <ol>
      <a href="#view">Project Overview</a>
      <li><a href="#tech">Technologies and Programming Languages</a></li>
      <li>
        <a href="misc">Miscellaneous</a>
          <ul>
            <li><a href="devenv">Development Environment</a></li>
            <li><a href="est">Time Estimate</a></li>
          </ul>
      </li>
      <li><a href="give">Contributions</a></li>
        <ul>
          <li><a href="coc">Code of Conduct</a></li>
          <li><a href="whattogive">What?</a></li>
          <li><a href="howtogive">How?</a></li>
          <li><a href="whygive">Why?</a></li>
        </ul>
      </li>><a href="bye">Conclusion</a></li>
      <li><a href="#contact">Contact</a></li>
      <li><a href="#ack">Acknowledgments</a></li>
    </ol>
  </details>



<details>
  <summary>File Hierarchy</summary>
</details>


<details>
  <summary>Current Tech Stack &nbsp; [<a href="#tech">view more details</a>]</p>
  </summary>
</details>


<details>
  <summary>Progress &nbsp; [<a href="#curr">view our progress, logs, and other documentation</a>]</summary>
    <p><strong><ins>Note</ins>:</strong><em> Last updated</em>: 8/9/23</p>
     <ol>
       <li><a href="080923">8/9/23</a></li>
     </ol>
  </summary>
</details>


---------------------------

<a name="view"></a>
## Project Overview 
`black-scholes-cpp` is a comprehensive C++ program designed to calculate the price of European options using the Black-Scholes formula. 


Going beyond the basic implementation, this project showcases an array of advanced features and enhancements, demonstrating a deep understanding of mathematical finance, numerical methods, and programming best practices.

&nbsp;


---------------------

<a name="feat"></a>
### <ins>Key Features</ins>:

1. **Input Modes**: The program supports various input modes to cater to diverse user needs. 
> - <ins>User Input</ins>: Users can interactively input option parameters through a command-line interface.
> - <ins>File Input</ins>: Option parameters can be read from external files, providing flexibility and ease of data input.
> - <ins>Database Input</ins>: Retrieve option parameters from a database, enabling integration with data storage systems.
> - <ins>Market Data Feeds/APIs</ins>: Fetch real-time market data from external sources or APIs, ensuring dynamic and up-to-date pricing information.


2. **Option Greeks Calculation**: The implementation includes a sophisticated module for calculating option Greeks, providing insights into the sensitivity of option prices to various factors.
> - <ins>Delta</ins>: Measures the sensitivity of the option price to changes in the underlying asset price.
> - <ins>Gamma</ins>: Reflects the rate of change of delta concerning changes in the underlying asset price.
> - <ins>Vega</ins>: Captures the sensitivity of the option price to changes in volatility.
> - <ins>Theta</ins>: Represents the time decay of the option price.
> - <ins>Rho</ins>: Illustrates the sensitivity of the option price to changes in the risk-free interest rate.


3. **Implied Volatility Calculation**:
> A function to calculate implied volatility, an important parameter in option pricing.

5. **Heston Model Integration**:
> `black-scholes-cpp` is enhanced to incorporate equations from the Heston model, allowing for a more nuanced understanding of volatility dynamics.

7. **Calibration Procedure for Heston Model**:
> The implementation includes a robust calibration procedure to estimate Heston model parameters based on market data.
> - Calibration ensures that the model aligns with observed market prices, enhancing its predictive power.

9. **Volatility Surface Calculation**:
> `black-scholes-cpp` calculates the implied volatility surface using the Heston model, offering a comprehensive view of implied volatilities across various strike prices and maturities.

11. **Monte Carlo Simulation**:
> A sophisticated Monte Carlo simulation is implemented to generate random paths for both the underlying asset price and volatility based on the Heston model.
> - This feature adds a layer of realism to the pricing model.

13. **Historical Volatility Analysis**:
> Functionality is incorporated to calculate historical volatility based on historical price data.
> - This analysis provides insights into the historical behavior of the underlying asset's volatility.

15. **Sensitivity Analysis**:
> `black-scholes-cpp` extends its capabilities to perform sensitivity analysis using the Heston model.
> - Exploring the impact of varying input parameters, such as mean reversion speed, volatility of volatility, and correlation, allows users to assess the model's sensitivity to different market conditions.

16. **Visualizations**:
> To enhance user understanding, `black-scholes-cpp` incorporates visualizations using plotting libraries.
> Users can intuitively interpret option prices, implied volatility surfaces, Greeks, and other relevant metrics.


&nbsp;

<p align="right">(<a href="#bs">back to top</a>)</p>

---------------------

<a name="curr"></a>
### <ins>Current Notes and/or Issues</ins>: 

- [x] ~~Figure out how to rewrite Makefile~~ ✓
- [x] ~~Re-install libcURL/cURL-openssl via Homebrew (incompatible w/ arm64?)~~ ✓
- [x] ~~Review MAKEFILE documentation: esp $(LIBS), $(LDFLAGS), $(LXXFLAGS).~~ ✓
- [x] ~~From CLI, understand exporting $(PATH)(s) to libcURL in root/.zshrc.~~ ✓
- [x] ~~Fix Git VS issues w/ SSH/GPG keys (ed25519, RSA) and/or authentication w/ fine-grained PACs~~. ✓
- [x] ~~Finalize high-level project structure (i.e. where driver goes, basic .cpp/.h division, basic class (and other high-level data structure) organization based on functionality).~~ ✓

- [ ] Handle all inputModes.
   > - [ ] **User Input**: Done, not tested.
   > - [ ] **File Input**: Done, not tested.
   > - [ ] **Database Input**: Haven't started, but know to use SQLite.
   > - [ ]  **External market data feeds / API**s: Haven't started, but have cURL set up. Also using Alpha Vantage Rapid API and already have private key. "Just" need to figure out configuration.
   
- [ ] Begin TESTING AND DEBUGGING!
      
- [ ] Optimizing code.
   > - Obv some shit will optimize a lot and take barely any time. Some shit will make zero-to-nil difference and take hours. Gotta prioritize.
   > - - Optimization ideas listed below, but some of it is obvious throughout code.
  
- [ ] Figure out what additional features to implement.
   > - [x]  ~~Option Greeks (calculating, setting, getting)~~ ✓
   > - [x]  ~~Enhanced Black-Scholes pricing models incorporating option Greeks (constructor, calculating, setting, getting)~~ ✓
   > - [x]   ~~Enhanced Black-Scholes pricing models incorporating implied volatility (constructor, calculating, setting, getting)~~ ✓
  
   > - [ ] **Heston Model**
     > > - Enhanced Black-Scholes pricing models incorporating Heston model equations
     > - [ ]  **Calibration procedure** to estimate the Heston model parameters based on market data
     > - [ ]  **Volatility surface calculation: c**alculate the implied volatility surface using the Heston Model
     > > -  By solving the Heston model equations and comparing the model prices with market prices, you can derive the implied volatility at different strikes and maturities, thus constructing the volatility surface.
     > - [ ]  **Greeks calculation:** Enhance your project to calculate option Greeks, such as delta, gamma, vega, theta, and rho, using the Heston Model.
     > > - These measures provide valuable insights into the sensitivity of option prices to changes in underlying factors.
   >   >  > - You can use finite difference methods or other numerical techniques to estimate these sensitivities based on the Heston model equations.
     > - [ ]  **Monte Carlo Simulation:** Implement Monte Carlo simulation to generate random paths for both the underlying asset price and volatility based on the Heston model.
     > - [ ] **Historical Volatility Analysis:** Incorporate functionality to calculate historical volatility based on historical price data.
   >  > - This can be useful for comparing the implied volatility from the Heston model with realized historical volatility.
   > > - You can calculate rolling or weighted average volatilities to capture different time horizons.
     > - [ ] **Sensitivity Analysis:** Extend your project to perform sensitivity analysis using the Heston model.
   >  > - Explore the impact of varying input parameters, such as mean reversion speed, volatility of volatility, and correlation, on option prices and Greeks.
   >  >   - This analysis can help assess the model's sensitivity to different market conditions.
     > - [ ] **Visualizations:** Enhance your project by adding visualizations to present the results more intuitively.
   > > - Plot option prices, implied volatility surfaces, Greeks, or other relevant metrics to provide a graphical representation of the Heston model outputs.
   
   - Divided Difference approach
     
- Perpetual American Options
  
- Matrix Math

   
<p align="right">(<a href="#bs">back to top</a>)</p>

---------------------

<a name="tech"></a>
## Technologies and Programming Languages

### <ins>Programming Language</ins>: **C++**
>  - `C++` remains the primary language for its efficiency and performance in numerical computations.

### <ins>Build System</ins>: **`CMake` and `Ninja`**
>  - `CMake` facilitates the building and compilation of this `C++`project.
  >  - It's widely used and supports various platforms.
>  - `Ninja` is a small build system automation tool for `C++` and `Python`, used as an alternative for `Make`.
>  - In conjunction with `CMake`, `Ninja` runs builds as fast as possible.

### <ins>Backend</ins>: **RESTful API (Optional):**
> - Design a RESTful API to expose your option pricing functionalities.
  > -  This allows for easy integration with different platforms and technologies.

### <ins>Libraries and Frameworks</ins>:
> - **`Boost` C++ Libraries:**
>>  - `Boost` libraries for `C++` offer utilities and functionalities that can enhance your project.
>- **`QuantLib` (Optional):**
>> - `QuantLib` provides tools for quantitative finance, including derivative pricing and risk management.
> ### <em>Testing, Mocking, and Quality Assurance</em>:
> - **`Google Test` (for Unit Testing):**
>>  - `Google Test` is a widely used testing framework for `C++`.
>>>  -  It supports test fixtures, test discovery, and various assertions.
> - **`Google Mock` (for Mocking):**
>> - `Google Mock` is a framework for creating mock classes and performing mock-based testing.
> - **`Clang` Static Analyzer (Optional):**
>> - `Clang Static Analyzer` is a powerful tool for static code analysis, helping to identify potential issues in the code.

### <ins>Database</ins>: **`SQLite`**
> - `SQLite` is a lightweight, embedded database that can be used for local storage of option parameters.


### <ins>Web APIs and HTTP Communication</ins>: **`cpp-httplib` (for HTTP server)**
> - A `C++` library for creating HTTP servers, enabling communication with your application via HTTP.

### <ins>Error Handling and Logging</ins>:  **`spdlog`**
- `spdlog` is a fast `C++` logging library that can be used for error handling and logging.
> - It provides various logging sinks and is easy to configure.


### <ins>API Documentation</ins>:
- **`Swagger`/`OpenAPI` (Optional):**
> - `Swagger` or `OpenAPI` can be used to document your RESTful API. It provides a standardized way to describe and document APIs.
- **`Doxygen`:**
> - `Doxygen` can generate documentation from your code comments. It's especially useful for documenting functions, classes, and project structure.

### <ins>Frontend</ins> (Optional):
- **Web Interface (HTML/CSS/JavaScript):**
> - If you plan to create a web-based interface for interacting with your application, standard web technologies can be used.

### <ins>Continuous Integration</ins>: **`Travis CI` or `GitHub Actions`**
> - Setting up continuous integration ensures that your project is automatically built and tested whenever changes are pushed to the repository.

### <ins>Dependency Management</ins>: **`Conan` or `vcpkg`**
> - Use a dependency manager like `Conan` or `vcpkg` to manage external libraries and ensure consistent builds across different environments.

### <ins>Containerization</ins> (Optional): **`Docker`**
> - `Docker` can be used to containerize your application, making it easy to deploy and run in different environments.

---------------------

<a name="map"></a>

## Roadmap

### <ins>Phase 1: Research and Understanding</ins> (Estimated Time: 15 hours)
1. Study Black-Scholes Model (5 hours):
- Dive into academic papers, online resources, and books to understand the mathematical foundations of the Black-Scholes model.
- Familiarize yourself with the Black-Scholes formula, its assumptions, and risk-neutral pricing.
2. Explore Additional Concepts (5 hours):
- Delve into option Greeks (delta, gamma, vega, theta, rho), implied volatility, and the Heston model.
- Gather insights from advanced topics such as calibration procedures, Monte Carlo simulation, and sensitivity analysis.
3. Resource Review (5 hours):
- Explore online tutorials, courses, and books recommended in the project description.
- Investigate GitHub repositories like QuantLib for practical implementations.
- Summarize key learnings and resources for quick reference.

### <ins>Phase 2: Project Setup and Planning</ins> (Estimated Time: 10 hours)
1. Define Project Structure (3 hours):
- Plan a directory structure for your project (e.g., src, include, test, docs).
- Decide on file naming conventions and coding standards.
2. Identify Main Components (3 hours):
- List the main components/modules required for the Black-Scholes model, option Greeks, and Heston model integration.
- Define interfaces between components.
3. Setup Version Control (4 hours):
- Initialize a Git repository for version control.
- Create a .gitignore file to exclude unnecessary files.
- Commit the initial project structure.


### <ins>Phase 3: Basic Implementation</ins> (Estimated Time: 30 hours)
1. Implement Black-Scholes Basics (15 hours):
- Implement the Black-Scholes formula for European options in the "src" directory.
- Develop necessary formulas and calculations for option pricing.
2. User Input Handling (8 hours):
- Implement user input functionality for option parameters.
- Validate and sanitize user inputs to ensure correctness.
3. File Input Handling (7 hours):
- Develop functions to read option parameters from external files (e.g., CSV).
- Handle errors gracefully and provide meaningful error messages.


### <ins>Phase 4: Advanced Feature</ins> (Estimated Time: 40 hours)
1. Option Greeks Calculation (15 hours):
- Extend the implementation to calculate option Greeks: delta, gamma, vega, theta, and rho.
- Ensure accurate and efficient calculations.
2. Enhanced Black-Scholes Pricing Models (15 hours):
- Implement implied volatility calculation in the Black-Scholes model.
- Incorporate Heston model equations for pricing.
3. Calibration Procedure (10 hours):
- Develop a calibration procedure to estimate Heston model parameters based on market data.
- Implement optimization algorithms (e.g., gradient descent) for parameter fine-tuning.

### <ins>Phase 5: Additional Features</ins> (Estimated Time: 35 hours)
1. Volatility Surface Calculation (15 hours):
- Implement functions to calculate the implied volatility surface using the Heston model.
- Visualize the surface using plotting libraries (e.g., Matplotlib).
2. Monte Carlo Simulation (10 hours):
- Develop Monte Carlo simulation for generating random paths based on the Heston model.
- Ensure realistic simulations for both asset price and volatility.
3. Historical Volatility Analysis (10 hours):
- Integrate functionality to calculate historical volatility based on historical price data.
- Implement data analysis tools for insights.

### <ins>Phase 6: Testing and Validation</ins> (Estimated Time: 20 hours)
1. Unit Testing (10 hours):
- Implement comprehensive unit tests for each component.
- Use a testing framework (e.g., Google Test) to automate tests.
2. Validation (10 hours):
- Validate the entire program against established pricing models.
- Compare results with known Black-Scholes and Heston model outcomes.


### <ins>Phase 7: Documentation and Optimization</ins> (Estimated Time: 20 hours)
1. Create README and Documentation (10 hours):
- Document the project overview, features, and usage in the README.
- Write detailed documentation for each feature, including examples.
2. Code Comments (5 hours):
- Add comments to your code for clarity and context.
- Ensure that the codebase is well-documented for future reference.
3. Optimization (5 hours):
- Optimize the performance of the option pricing calculations.
- Document performance improvements achieved.

### <ins>Phase 8: Visualization and Finalization</ins> (Estimated Time: 15 hours)
1. Visualizations (10 hours):
- Enhance the project with visualizations using plotting libraries.
- Plot option prices, implied volatility surfaces, Greeks, or other relevant metrics.
2. Finalize Documentation (5 hours):
- Review and finalize all project documentation.
- Ensure consistency and completeness.


&nbsp;


<p align="right">(<a href="#bs">back to top</a>)</p>


---------------------

<a name="impl"></a>
## Project Implementation Guide

NEVER

&nbsp;

<p align="right">(<a href="#bs">back to top</a>)</p>

---------------------
<a name="io"></a>
## Potential I/O Specifications

<a name="i"></a>
### Input: 

FILL THIS SHIT OUT LATERRRR

&nbsp; 

<a name="o"></a>
### Output: 

FUCK THIS

&nbsp; 

<a name="err"></a>
### __<ins>*Error Handling*</ins>:__

&nbsp;


---------------------
<a name="flow"></a>
## Basic Workflow Guide

IDFK


&nbsp; 
<p align="right">(<a href="#bs">back to top</a>)</p>



--------------------

<a name="plus"></a>
## Future Enhancements:

WHAT THE FUCK
<p align="right">(<a href="#bs">back to top</a>)</p>

---------------------
  
<a name="install"></a>
## User Installation

<a name="prereq"></a>
### System Prerequisites:

`black-scholes-cpp` mandates:
- A functional C++ compiler compatible with C++20, 
- required libraries installed (e.g., CURL for API access, SQLite for database interactions),
- `GoogleTest` mocking and unit-testing library installed,
> - Use `brew install googletest` to install to your device via Homebrew.
- the `Threads` package to handle threading-related functionality, 
> - Use `brew install --cask threads` to install to your device via Homebrew.
- the ability to build, run, and debug using `CMake` of version `3.26` or higher, and
- the `Ninja` build system.
> - Via Homebrew, install with the following command: `brew install ninja`.


&nbsp; 

<a name="buildnrun"></a>
### Build and Run: 
1. Clone the repository: 
> - `git clone https://github.com/lyndskg/black-scholes-cpp.git`
> - `cd black-scholes-cpp`
2. Build the project:
> - `cmake -Bbuild-cmake -H. -GNinja`
> - `cd build-cmake`
3. Run the program:
> - `cmake --build .`
4. Explore the different features and input modes provided by the program.
> - Try out the model interactively via CLI, or stream in real data feeds from live API streams.
5. To clean the project, access the current build directory:
> - `pwd` (Make sure you're in `build-cmake`; if not, `cd build-cmake`)
> - `ninja -t clean`
> - Repeat step 3 as needed.


<p align="right">(<a href="#bs">back to top</a>)</p>


---------------

<a name="usage"></a>
## Usage

<a name="use-case"></a>
### Potential Use Cases: 


- Algorithmic trading strategy formulation, backtesting, and refinement.
- Real-time market data monitoring and informed decision-making.
- Portfolio analysis and optimization for traders and investors.


&nbsp;

<p align="right">(<a href="#bs">back to top</a>)</p>

<a name="appl"></a>
### Practical Applications:

WRITE SHIT HERE

&nbsp;

<p align="right">(<a href="#bs">back to top</a>)</p>

---------------------

<a name="devenv"></a>
#### Development Environment:

> - **Operating System:** macOS Ventura *(version 14.3.1)*
> - **Architecture:** Apple arm64


<p align="right">(<a href="#bs">back to top</a>)</p>

---------------------
<a name="give"></a>
## How to Support Us

We welcome contributions from the community to help improve `black-scholes-cpp` and make it even better.

- **Contribute:** Don't.
- **Donate:** DON'T!


<p align="right">(<a href="#bs">back to top</a>)</p>

---------------------
<a name="bye"></a>
## Conclusion

WRITE SHIT 

&nbsp;

<p align="right">(<a href="#bs">back to top</a>)</p>

---------------------------
<a name="contact"></a>
<!-- CONTACT -->
## Contact

Lyndsey Gu - [@lyndskg](https://twitter.com/lyndskg) - lyndsey.gu@gmail.com

Project Link: [https://github.com/lyndskg/black-scholes-cpp](https://github.com/lyndskg/black-scholes-cpp)

<p align="right">(<a href="#bs">back to top</a>)</p>

---------------------------
<a name="ack"></a>
<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

> Put
> Shit
> Here

**<ins>Resources</ins>:**
1. **Online tutorials:** 
> - 
2. **Online resources:** 
3. **GitHub Repos**:
> - **<em>CMake & Google Test framework</em>:** [Jamagas](https://github.com/Jamagas/CMake), [TimothyHelton](https://github.com/TimothyHelton/cpp_project_template/tree/master), [DavidAg](https://github.com/davidag/gtestmock-cmake-template/tree/master), [Pyarmak](https://github.com/pyarmak/cmake-gtest-coverage-example), [PhDP](https://github.com/PhDP/cuda-cmake-gtest-gbench-starter/tree/main), [SRombauts](https://github.com/SRombauts/cpp-skeleton/tree/master), [pandreidoru](https://github.com/pandreidoru/cmake_googletest_gcov/tree/master)

<p align="right">(<a href="#bs">back to top</a>)</p>


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/othneildrew/Best-README-Template.svg?style=for-the-badge
[contributors-url]: https://github.com/othneildrew/Best-README-Template/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/othneildrew/Best-README-Template.svg?style=for-the-badge
[forks-url]: https://github.com/othneildrew/Best-README-Template/network/members
[stars-shield]: https://img.shields.io/github/stars/othneildrew/Best-README-Template.svg?style=for-the-badge
[stars-url]: https://github.com/othneildrew/Best-README-Template/stargazers
[issues-shield]: https://img.shields.io/github/issues/othneildrew/Best-README-Template.svg?style=for-the-badge
[issues-url]: https://github.com/othneildrew/Best-README-Template/issues
[license-shield]: https://img.shields.io/github/license/othneildrew/Best-README-Template.svg?style=for-the-badge
[license-url]: https://github.com/othneildrew/Best-README-Template/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/othneildrew
[product-screenshot]: images/screenshot.png
[Next.js]: https://img.shields.io/badge/next.js-000000?style=for-the-badge&logo=nextdotjs&logoColor=white
[Next-url]: https://nextjs.org/



## Things to work on:
1. Reading input from database: `SQLite`
2. Reading input from file: Get `.CSV` samples from `Kaggle` to test.
3. Reading input from external market feeds / APIs. Retrieve Alpha Vantage Rapid API Private Key and finish configuration.
4. Testing and debugging. 
5. Finishing `optionGreeksModel` class implementations.
6. Implementing more advanced functionalities: implied volatility (IV), Heston model, Monte Carlo, etc.

## Optimizations:
1. Check all `#includes` and using directives.
2. In function `double blackScholesModel::calculateOptionPrice()`, can use if-elif-else statement, switch statement, or ternary operator for `optionType`.
3. In class `blackScholesModel`, `optionType` (i.e. Call vs. Put) can be represented as `enum` type or `char`. If latter, does it need to be initialized in ctor?
4. In function `double blackScholesModel::normalCDF()`, should the result be returned via ternary operator or if-else statement?
5. In the main driver function in `main.cpp`, should an instance of blackScholesModel using the custom ctor initializing all pricing input variables be used instead of having to use the same getter methods in the driver itself?
6. In function `double blackScholesModel::normalCDF()`, a more efficient approximation can be used. 
7. In function `inputReader::readInputFromUser()`, should validation be accomplished using its two current helper functions or via `validateAndSetInputValues()`?

## Bug fixes:
1. In function `Program::get_options()`, in the default case (i.e. no options are flagged), should figure out how to print invalid command-line argument (`int option`) to `stderr` (`cerr`) for debugging purposes.


[dr-liangma/BlackScholes_MonteCarlo](https://github.com/dr-liangma/BlackScholes_MonteCarlo/tree/master)
- Monte Carlo Methods applied to the Black-Scholes financial market model
[yogesh-vishwakarma/Stock-market-prediction-using-Monte-Carlo-simulation-Black-Scholes](https://github.com/yogesh-vishwakarma/Stock-market-prediction-using-Monte-Carlo-simulation-Black-Scholes/tree/master)
- Stock Market Forecasting using Parallel Monte-Carlo Simulations and Machine Learning
[AiglonDore/black-scholes](https://github.com/AiglonDore/black-scholes/tree/main)
[OskarMai/BSOptionPricer](https://github.com/OskarMai/BSOptionPricer/tree/main)
[nburma01/QuantLibTest](https://github.com/nburma01/QuantLibTest/tree/master)
[LittleQuant/DerivativePricing](https://github.com/LittleQuant/DerivativePricing/tree/master)
- Black Scholes derivatives pricer implemented following and referencing the C++ Design Patterns and Derivatives Pricing 2nd Edition by Mark Joshi.
- Personal project to write a dynamic library for pricing financial derivatives using Monte Carlo methods under the Black Scholes model.
[redbzi/MC](https://github.com/redbzi/MC/tree/master)
- Monte-Carlo simulations around the Black-Scholes and Heston models.
[oguzaras/-FFTBlackScholes](https://github.com/oguzaras/-FFTBlackScholes/tree/master)
- Fast Fourier Transform Black-Scholes

[CHAT MF GPT](https://chat.openai.com)



