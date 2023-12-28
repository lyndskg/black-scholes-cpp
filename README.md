<a name="bs"></a>

<h1 align="center">black-scholes-cpp</h1>

<h4 align="center"><ins><strong><em>* a C++ program that calculates the price of European options using the Black-Scholes formula * </em></strong></ins></h4>

## SIDE-NOTE: IS BACKTESTING THAT BIG OF A DEAL IN THE FUTURE?

**<ins>TO-DO</ins>:**
- [ ] To doooo

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
          <li><a href="#obj">Objectives</a></li>
          <li><a href="#curr">Current Notes and Issues</a></li>
        </ul>
      </li>
      <li><a href="#feat">Key Features</a></li>
      <li><a href="#stackz">Currently Used Tech Stacks</a></li>
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
      <li>
        <a href="#view">Project Overview</a>
        <ul>
          <li><a href="#obj">Objectives</a></li>
          <li><a href="#curr">Current Notes and Issues</a></li>
        </ul>
      </li>
      <li><a href="#tech">Technologies and Programming Languages</a></li>
      <li><a href="#stackz">Currently Used Tech Stacks</a></li>
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
          <li><a href="guide">User Installation Guide</a></li>
        </ul>
      </li>
      <li><a href="usage">Usage</a></li>
      <li><a href="#sys">System Requirements</a></li>
      <li><a href="#user">User Requirements</a></li>
    </ol>
  </details>
-
  <details>
    <summary><strong><em>IV: Miscellaneous</em></strong></summary>
    <ol>
      <a href="#view">Project Overview</a>
      <li><a href="#tech">Technologies and Programming Languages</a></li>
      <li><a href="#stackz">Currently Used Tech Stacks</a></li>
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
  <summary>Current Tech Stacks &nbsp; [<a href="#stackz">view more details</a>]</p>
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

## TODO List:
1. ~~Figure out how to rewrite Makefile~~ ✓
2. ~~Re-install libcURL/cURL-openssl via Homebrew (incompatible w/ arm64?)~~ ✓
3. ~~Review MAKEFILE documentation: esp $(LIBS), $(LDFLAGS), $(LXXFLAGS).~~ ✓
4. ~~From CLI, understand exporting $(PATH)(s) to libcURL in root/.zshrc.~~ ✓
5. ~~Fix Git VS issues w/ SSH/GPG keys (ed25519, RSA) and/or authentication w/ fine-grained PACs~~. ✓
6. ~~Finalize high-level project structure (i.e. where driver goes, basic .cpp/.h division, basic class (and other high-level data structure) organization based on functionality).~~ ✓
7. Handle all inputModes.
   a. User Input: Done, not tested.
   b. File Input: Done, not tested.
   c. Database Input: Haven't started, but know to use SQLite.
   d. external market data feeds / APIs: Haven't started, but have cURL set up. Also using Alpha Vantage Rapid API and already have private key. "Just" need to figure out configuration.
9. Begin TESTING AND DEBUGGING!
   - UNIT TESTS. NOW.
10. Optimizing code.
- Obv some shit will optimize a lot and take barely any time. Some shit will make zero-to-nil difference and take hours. Gotta prioritize.
- Optimization ideas listed below, but some of it is obvious throughout code.
10. Figure out what additional features to implement.
- ~~option Greeks (calculating, setting, getting)~~ ✓
- ~~enhanced Black-Scholes pricing models incorporating option Greeks (constructor, calculating, setting, getting)~~ ✓
- ~~enhanced Black-Scholes pricing models incorporating implied volatility (constructor, calculating, setting, getting)~~ ✓
- Heston model
  - enhanced Black-Scholes pricing models incorporating Heston model equations
  - calibration procedure to estimate the Heston model parameters based on market data
  - volatility surface calculation: calculate the implied volatility surface using the Heston model
     -  By solving the Heston model equations and comparing the model prices with market prices, you can derive the implied volatility at different strikes and maturities, thus constructing the volatility surface.
   -  Greeks calculation: Enhance your project to calculate option Greeks, such as delta, gamma, vega, theta, and rho, using the Heston model.
      - These measures provide valuable insights into the sensitivity of option prices to changes in underlying factors. You can use finite difference methods or other numerical techniques to estimate these sensitivities based on the Heston model equations.
    - Monte Carlo Simulation: Implement Monte Carlo simulation to generate random paths for both the underlying asset price and volatility based on the Heston model.
    - Historical Volatility Analysis: Incorporate functionality to calculate historical volatility based on historical price data. This can be useful for comparing the implied volatility from the Heston model with realized historical volatility. You can calculate rolling or weighted average volatilities to capture different time horizons.
    - Sensitivity Analysis: Extend your project to perform sensitivity analysis using the Heston model. Explore the impact of varying input parameters, such as mean reversion speed, volatility of volatility, and correlation, on option prices and Greeks. This analysis can help assess the model's sensitivity to different market conditions.
    - Visualizations: Enhance your project by adding visualizations to present the results more intuitively. Plot option prices, implied volatility surfaces, Greeks, or other relevant metrics to provide a graphical representation of the Heston model outputs.
- Divided Difference approach
- Perpetual American Options
- Matrix Math

## Things to work on:
1. Reading input from database: SQLite
2. Reading input from file: Get .CSV samples from Kaggle to test.
3. Reading input from external market feeds / APIs. Retrieve Alpha Vantage Rapid API Private Key and finish configuration.
4. Testing and debugging. 
5. Finishing optionGreeksModel class implementations.
6. Implementing more advanced functionalities: implied volatility (IV), Heston model, Monte Carlo, etc.

## Optimizations:
1. Check all #includes and using directives.
2. In function "double blackScholesModel::calculateOptionPrice()", can use if-elif-else statement, switch statement, or ternary operator for optionType.
3. In class blackScholesModel, optionType (i.e. Call vs. Put) can be represented as enum type or char. If latter, does it need to be initialized in ctor?
4. In function "double blackScholesModel::normalCDF()", should the result be returned via ternary operator or if-else statement?
5. In the main driver function in main.cpp, should an instance of blackScholesModel using the custom ctor initializing all pricing input variables be used instead of having to use the same getter methods in the driver itself?
6. In function "double blackScholesModel::normalCDF()", a more efficient approximation can be used. 
7. In function "inputReader::readInputFromUser()", should validation be accomplished using its two current helper functions or via validateAndSetInputValues()?

## Bug fixes:
1. In function "Program::get_options()", in the default case (i.e. no options are flagged), should figure out how to print invalid command-line argument (int option) to stderr (cerr) for debugging purposes.


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



