<a name="bs"></a>

<h1 align="center">black-scholes-cpp</h1>

<h4 align="center"><ins><strong><em>* a C++ program that calculates the price of European options using the Black-Scholes formula * </em></strong></ins></h4>

## SIDE-NOTE: IS BACKTESTING THAT BIG OF A DEAL IN THE FUTURE?

**<ins>TO-DO</ins>:**
- [x] ~~Figure out how to rewrite Makefile~~ ✓
- [x] ~~Re-install libcURL/cURL-openssl via Homebrew (incompatible w/ arm64?)~~ ✓
- [x] ~~Review MAKEFILE documentation: esp $(LIBS), $(LDFLAGS), $(LXXFLAGS).~~ ✓
- [x] ~~From CLI, understand exporting $(PATH)(s) to libcURL in root/.zshrc.~~ ✓
- [x] ~~Fix Git VS issues w/ SSH/GPG keys (ed25519, RSA) and/or authentication w/ fine-grained PACs~~. ✓
- [x] ~~Finalize high-level project structure (i.e. where driver goes, basic .cpp/.h division, basic class (and other high-level data structure) organization based on functionality).~~ ✓
- [ ] Handle all inputModes.
   a. User Input: Done, not tested.
   b. File Input: Done, not tested.
   c. Database Input: Haven't started, but know to use SQLite.
   d. external market data feeds / APIs: Haven't started, but have cURL set up. Also using Alpha Vantage Rapid API and already have private key. "Just" need to figure out configuration.
- [ ] Begin TESTING AND DEBUGGING!
   - UNIT TESTS. NOW.
- [ ] Optimizing code.
   - Obv some shit will optimize a lot and take barely any time. Some shit will make zero-to-nil difference and take hours. Gotta prioritize.
   - Optimization ideas listed below, but some of it is obvious throughout code.
- [ ] Figure out what additional features to implement.
   -  ~~option Greeks (calculating, setting, getting)~~ ✓
   - ~~enhanced Black-Scholes pricing models incorporating option Greeks (constructor, calculating, setting, getting)~~ ✓
   -  ~~enhanced Black-Scholes pricing models incorporating implied volatility (constructor, calculating, setting, getting)~~ ✓
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

<a name="view"></a>
## Project Overview 
The Black-Scholes Model Implementation for Option Pricing project is a comprehensive C++ program designed to calculate the price of European options using the Black-Scholes formula. Going beyond the basic implementation, this project showcases an array of advanced features and enhancements, demonstrating a deep understanding of mathematical finance, numerical methods, and programming best practices.

&nbsp;


---------------------

<a name="obj"></a>
### <ins>Objectives</ins>:


&nbsp;

---------------------

<a name="curr"></a>
### <ins>Current Notes and/or Issues</ins>: 

> Write
>
> Stuff
> 
> Here

   
<p align="right">(<a href="#graph">back to top</a>)</p>

---------------------

<a name="tech"></a>
## Technologies and Programming Languages

<a name="stackz"></a>
### Currently Used Tech Stack(s): 

__1. <ins>Backend</ins>: (Data Processing and Business Logic)__
`C++` as the core programming language for library development.
- Utilize object-oriented programming principles for modular and extensible code.
- Incorporate `C++ Standard Library` features for foundational functionalities.

__2. <ins>APIs, Frameworks, and Libraries</ins>:__

1. libcurl: A versatile library for HTTP communication, vital for sending requests to the Investopedia trading game API.
2. WebSocket++: A C++ library for WebSocket communication, facilitating real-time data streaming and interactivity.
3. RapidJSON: A fast JSON parser and generator for C++, pivotal for parsing API responses.
4. Boost: Utilize Boost libraries for various utilities and enhancements.
5. Catch2: A C++ unit testing framework for robust testing.
   
__3. <ins>Web APIs and HTTP Communication</ins>:__

- Utilize libcurl to establish communication with the Investopedia API endpoints.
- Incorporate WebSocket++ to establish WebSocket connections for real-time data streaming and interactivity.
- Craft HTTP GET/POST requests with appropriate headers and parameters to interact with the API.
- Leverage libcurl's features for efficient data transmission and response handling.

**4. <ins>Error Handling and Logging</ins>:**
- Implement a comprehensive error-handling mechanism that covers various scenarios.
- Utilize exception handling in C++ to gracefully manage errors and provide informative error messages.
- Incorporate logging mechanisms to track crucial interactions, debugging information, and error occurrences.
      
**5. <ins>Testing, Mocking, and Quality Assurance</ins>:**
- Employ the Catch2 testing framework for unit testing and regression testing.
- Design unit tests to validate individual functions and components of the library.
- Consider implementing mocks or fakes for API responses and WebSocket data during testing to simulate different scenarios.
  
__6. <ins>Logging and Documentation</ins>:__
- Integrate a logging library (e.g., Boost.Log) to record library interactions, requests, responses, and WebSocket data.
- Document code comprehensively using inline comments to explain complex functions and processes.
- Create an extensive documentation guide, covering library installation, usage, troubleshooting, and contributing guidelines.
- Provide sample code snippets and practical examples to guide developers through different aspects of the library.


---------------------

<a name="map"></a>
## Roadmap


**Week 1-2: Research and In-Depth Planning**

- Immerse yourself in GraphQL principles, dissecting query structure and response formats.
- Gain a deep understanding of the Investopedia trading game API, exploring available endpoints and data structures.
- Define project scope, objectives, and success criteria.
- Craft a meticulous roadmap, delineating architectural considerations and design strategies.

**Week 3-4: Architectural Blueprint**

- Architect a modular and scalable library design, encompassing modules for query construction, request dispatch, response processing, and error handling.
- Define the class hierarchy and data models, aligning them with GraphQL paradigms.
- Select appropriate third-party libraries for HTTP communication and GraphQL parsing.

**Week 5-6: Core Functionality Implementation**

- Develop core mechanisms for sending GraphQL requests to the Investopedia API, emphasizing robustness and efficiency.
- Concentrate on programmatically generating complex and valid GraphQL queries.
- Establish an elegant error-handling framework to gracefully manage unforeseen scenarios.

**Week 7-8: Response Handling and User Interaction**

- Implement comprehensive mechanisms for parsing and processing diverse responses from the API.
- Construct an intuitive and user-centric interface that abstracts the intricacies of GraphQL operations.
- Enable developers to tailor queries to specific needs and seamlessly manage authentication tokens.

**Week 9-10: Comprehensive Documentation and Debugging Strategies**

- Produce thorough documentation covering both technical intricacies and practical usage of the library.
- Address common pitfalls, provide troubleshooting techniques, and offer practical debugging strategies.
- Augment the documentation with annotated code examples, illustrative diagrams, and real-world scenarios.

**Week 11-12: Rigorous Testing, Refinement, and Packaging**

- Subject the library to rigorous testing across various usage scenarios, ensuring robustness and performance.
- Incorporate feedback from testing phases to enhance code quality and optimize performance.
- Package the library for distribution, accompanied by well-structured installation instructions and usage guidelines.



&nbsp;


<p align="right">(<a href="#graph">back to top</a>)</p>

---------------------
<a name="todo"></a>
### <ins>*To-Do List</ins>:*


&nbsp;


<p align="right">(<a href="#graph">back to top</a>)</p>

---------------------

<a name="impl"></a>
## Project Implementation Guide

1. **<ins>Getting Started</ins>:**
> 1. Familiarize yourself with the GraphQL specification and the basics of making GraphQL requests. 
> 2. Understand the GraphQL protocol, including schema definition, query language, and response format.
> 3. Study existing GraphQL libraries and clients to gain insights into their design and implementation.
> 4. Implement the necessary components to handle GraphQL queries and responses in your C++ library.
> 5. Explore existing GraphQL libraries in C++ for inspiration. 
> 6. Design and implement a library that abstracts away the complexities of working with GraphQL.
2. **<ins>Optimization</ins>:**
> - Optimize the library for efficiency and speed when handling GraphQL requests and responses.
> - Implement techniques such as caching, query optimization, or parallel request processing.
> - Measure and document the performance improvements achieved.
3. **<ins>Documentation</ins>:**
> - Create a README file that explains the library's purpose, features, and usage. 
> - Document the library's API usage, supported features, and code examples to assist users.
> - Consider providing sample applications or tutorials that showcase the library's capabilities.
> - Provide code examples and document the library's API.
> - Consider writing technical documentation or blog posts to showcase your library and explain its benefits and usage.



1. **Getting Started:** Configure your development environment, encompassing the chosen IDE and requisite libraries.

2. **Library Blueprint:** Design classes and functions aligned with GraphQL principles and efficient API integration.

3. **HTTP Communication:** Employ libraries such as libcurl to establish robust communication channels with the Investopedia API.

4. **Query Construction:** Create flexible and expressive functions, empowering users to craft intricate GraphQL queries with ease.

5. **Response Processing:** Design adaptable parsing mechanisms to extract pertinent data from the API's complex responses.

6. **Error Management:** Engineer an elegant error-handling mechanism, offering meaningful feedback to developers.

7. **User-Friendly Interface:** Develop an ergonomic interface that empowers users to interact with the library sans GraphQL intricacies.

8. **Debugging Strategies:** Elaborate on potential challenges, providing systematic debugging strategies in your documentation.


&nbsp;

<p align="right">(<a href="#graph">back to top</a>)</p>

---------------------
<a name="io"></a>
## Potential I/O Specifications

<a name="i"></a>
### Input: 

GraphQL queries, API endpoint, authentication tokens.

<a name="o"></a>
### Output: 

Processed API responses, distilled data, informative error messages.

<a name="err"></a>
#### __<ins>*Error Handling*</ins>:__

&nbsp;


---------------------

<a name="feat"></a>
## Key Features



<p align="right">(<a href="#graph">back to top</a>)</p>

---------------------
<a name="flow"></a>
## Basic Workflow Guide

1. Familiarize yourself with the GraphQL specification and the basics of making GraphQL requests. 
2. Understand the GraphQL protocol, including schema definition, query language, and response format.
3. Study existing GraphQL libraries and clients to gain insights into their design and implementation.
4. Implement the necessary components to handle GraphQL queries and responses in your C++ library.
5. Explore existing GraphQL libraries in C++ for inspiration. 
6. Design and implement a library that abstracts away the complexities of working with GraphQL.


1. Integrate the "graphQLOL" library into your C++ project.
   
2. Leverage the library's functions to construct GraphQL queries, dispatch requests, and proficiently handle responses.


&nbsp; 
<p align="right">(<a href="#graph">back to top</a>)</p>



--------------------

<a name="plus"></a>
## Future Enhancements:

<p align="right">(<a href="#graph">back to top</a>)</p>

---------------------
  
<a name="install"></a>
## User Installation

<a name="prereq"></a>
### System Prerequisites:

The library mandates a functional C++ compiler, pertinent libraries for HTTP communication, and consistent internet connectivity for API interaction.

<a name="preweb"></a>
#### **Web App:**




<a name="predesk"></a>
#### **Desktop App:**


<a name="prefile"></a>
> **<ins>File System Permissions (*Desktop App*)</ins>:**


<a name="preaiml"></a>
#### **Optional AI/ML Permissions:**


<a name="leg"></a>
#### **Legal and Copyright Compliance:**


<a name="priv"></a>
#### **Privacy and Data Security:**

<p align="right">(<a href="#graph">back to top</a>)</p>

------

<a name="guide"></a>
### Installation Guides:

<a name="webinst"></a>
#### **Web App:**

<a name="instmac"></a>
#### **Desktop App (macOS):**


<a name="climac"></a>
##### 1. <ins>Command Line Installation</ins>:


<a name="gitmac"></a>
##### 2. <ins>Github Installation</ins>:

&nbsp;


<a name="instwindows"></a>
#### **Desktop App (Windows):**

&nbsp;

<p align="right">(<a href="#graph">back to top</a>)</p>

---------------

<a name="usage"></a>
## Usage

<a name="use-case"></a>
### Potential Use Cases: 


- Algorithmic trading strategy formulation, backtesting, and refinement.
- Real-time market data monitoring and informed decision-making.
- Portfolio analysis and optimization for traders and investors.



&nbsp;

<p align="right">(<a href="#graph">back to top</a>)</p>

<a name="appl"></a>
### Practical Applications:


&nbsp;

<p align="right">(<a href="#graph">back to top</a>)</p>

---------------------

<a name="misc"></a>
### <ins>Miscellaneous</ins>:

<a name="est"></a>
#### <ins>Time Estimate</ins>:

Approximately 40-60 hours


<p align="right">(<a href="#graph">back to top</a>)</p>

---------------------

<a name="devenv"></a>
#### Development Environment:

> - **Operating System:** macOS Ventura *(version 14.3.1)*
> - **Architecture:** Apple arm64


<p align="right">(<a href="#graph">back to top</a>)</p>

---------------------
<a name="give"></a>
## How to Support Us

We welcome contributions from the community to help improve `graphQLOL` and make it even better.

- Contribute: Encourage developers to actively participate by submitting pull requests, identifying bugs, and suggesting enhancements via GitHub.
- Donate: Highlight how donations will bolster continuous development, long-term maintenance, and the potential expansion of the library's scope.


<p align="right">(<a href="#graph">back to top</a>)</p>

---------------------
<a name="bye"></a>
## Conclusion

`graphQLOL` embodies a robust C++ library, proficiently encapsulating the intricacies of GraphQL integration and enabling seamless communication with the Investopedia trading game API. Through meticulous documentation, strategic design choices, and the potential for AI integration, the project underscores your mastery of software development while making a substantial contribution to the dynamic domain of algorithmic trading and financial analysis.

Thank you for choosing `graphQLOL`, and let's embark on this journey of audio conversion excellence together.

<p align="right">(<a href="#graph">back to top</a>)</p>

---------------------------
<a name="contact"></a>
<!-- CONTACT -->
## Contact

Lyndsey Gu - [@lyndskg](https://twitter.com/lyndskg) - lyndsey.gu@gmail.com

Project Link: [https://github.com/your_username/repo_name](https://github.com/lyndskg/graphQLOL)

<p align="right">(<a href="#graph">back to top</a>)</p>

---------------------------
<a name="ack"></a>
<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

> Put
> Shit
> Here

**<ins>Resources</ins>:**
1. **Online tutorials:** 
> - "How to build a `GraphQL` server"
> - "How to `GraphQL`"
> - "Creating Your First `GraphQL` API"
2. **Online resources:** GraphQL official documentation, `GraphQL` APIs and clients, `GraphQL` C/C++ Libraries
3. **GitHub Repos**: `libgraphqlparser`, `cppgraphqlgen`

<p align="right">(<a href="#graph">back to top</a>)</p>


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



