
# About
coming later

# Programs
`weighted_least_squares`
plots height as a function of time & uses weighted
least squares equations to fit a line 
<img src="/images/weighted_least_squares.png" height="300" alt="Weighted Least Squares">

`feigenbaum`
quantifies the approach of chaos via period doubling with the standard logistic map 
<img src="/images/feigenbaum.png" height="300" alt="Feigenbaum Constant">

`logistic_map`
calculates sequence for given parameter of <i>r</i>
& plots sequence as a function of the parameter 

<img src="/images/logistic_map_1.png" height="380" alt="Logistic Map I">

`logistic_map_redux`
logistic map with plotted sequences of <i>N</i> vs <i>X_n</i> for different values of <i>r</i>  
<img src="/images/logistic_map_redux.png" height="380" alt="Logistic Map">

`lyapunov`
calculates and plots the lyapunov exponent which characterizes 
sensitivity to initial conditions  
(the rate of separation of infinitesimally close trajectories)  
<img src="/images/lyapunov.png" height="300" alt="Lyapunov">

<img src="/images/logistic_map_lyapunov.png" height="380" alt="Logistic Map Lyapunov">

`witch_of_agnesi`
plots the famous curve of Maria Agnesi  
<img src="/images/witch_of_agnesi.png" height="300" alt="Witch of Agnesi">

`linear_least_squares`
plots a polynomial fitting for y to x and x to y  
<img src="/images/linear_least_squares.png" height="300" alt="Linear Least Squares">

`fibonacci`
computes the fibonacci sequence up to n terms & plots convergence to the golden ratio   
<img src="/images/fibonacci.png" height="300" alt="Fibonacci">

`pendulum`
plots the standard solution of a pendulum starting from rest  
<img src="/images/pendulum.png" height="300" alt="Pendulum">

`max_finder`
returns the maximum value of a matrix and its index  

`bisection_method`
calculates the cube root of 169 using the bisection method 

`secant method`
calculates the cube root of 169 using the secant method

`newton_raphson_legendre`
finds the smallest positive root of the ninth legendre polynomial using the Newton-Raphson technique

`finite_square_well`
plots the lowest solutions to the square well

`finite_square_well_energies`
finds the first allowable energies of a finite square well by calculating the 
intersections of the graphs  
<img src="/images/finite_square_well_1.png" width="500" alt="Finite Square Well Potential">
  
<img src="/images/finite_square_well_2.png" width="500" alt="Finite Square Well Solutions">

`function_plot`
simply plots a standard function

`runge_phenomenon`
plots the oscillation at edges of intervals due to high degree Lagrangian polynomials (runge's phenomenon)over equispaced interpolation points and plots interpolating polynomials of the 5th & 9th order

<img src="/images/runge_phenomenon_1.png" width="500" alt="Runge Phenomenon I">

<img src="/images/runge_phenomenon_2.png" width="500" alt="Runge Phenomenon I">

`root_of_bessel`
plots and finds the root of the bessel function

<img src="/images/bessel_root.png" width="800" alt="Root of the Bessel Function">

`interpolations	`
finds linear, quadratic, and cubic interpolations of the airy pattern 

<img src="/images/interpolations.png" width="500" alt="Linear, Quadratic, and Cubic Interpolations">

`airy pattern`
plots the airy pattern continuously and for a discrete set of values

<img src="/images/airy_pattern_1.png" width="500" alt="Airy Pattern I">

<img src="/images/airy_pattern_2.png" width="500" alt="Airy Pattern II"> 

`derivative_approx_diff	`
plots the forward, backward, and central approximations of the derivative of a function

<img src="/images/derivative_approx_diff.png" width="500" alt="Derivative Approximations"> 

`fresnel_integrals`
numerically integrates the Fresnel integrals to plot diffraction pattern of knife edge

<img src="/images/fresnel_integrals.png" width="500" alt="Diffraction Pattern of Knife Edge"> 

`integration_i`
integrates sin function using trapezoid, Simpson's, and Simpson's 3/8 rule

<img src="/images/simpson_rule.png" width="500" alt="Simpson's Rule"> 

<img src="/images/simpson_3_8_rule.png" width="500" alt="Simpson's 3/8 Rule"> 

<img src="/images/simpson_3_8_rule.png" width="500" alt="Trapezoid Rule"> 

`large_amp_pendulum`
plots the period of the large amplitude pendulum as a function of the amplitude

<img src="/images/large_amp_pendulum_1.png" width="500" alt="Period of a Large Amplitude Pendulum"> 
<img src="/images/large_amp_pendulum_2.png" width="500" alt="The Elliptic Integral of the First Kind"> 

`2D_random_walkers`
visualizes 1,000 2D random walkers starting at same origin at same time
<img src="/images/random_walkers.png" width="500" alt="1,000 2D Random Walkers"> 

`integration_1`
integrates a two dimensional integral with the trapezoidal rule 

`integration_2`
integrates a multi-dimensional integral

`linear_congruential_rand`
generates a series of random numbers starting from uniform using pseudorandom generator between 0 and 1 and compares with MATLAB rand() via histograms
<img src="/images/lcg_rand.png" width="500" alt="Linear Congruential Random Number Generator"> 

# Drake Equation 
MATLAB program allows for users inputs to the factors of the Drake Equation, which attempts to calculate
the number of civilizations on life-bearing planets in the galaxy that can emit detectable signals. 

<br><img src="/drake_equation/factors.png" height="300" alt="Drake Equation Visualization">

`main`
allows users to input the factors for the Drake Equation and plots the number of civilizations as a function of varying L, which represents how long a civilization can emit signals (i.e. the life span of the civilization) 

`examples`
gives four examples of variable inputs to the Drake Equation and displays the resulting graph with upper and lower bound indicators
<br><img src="/drake_equation/graphs.png" height="300" alt="Drake Equation Visualization">

`fixed_L`
computes the number of civilizations *N* with the Drake Equation with user inputs for all factors except <i>L</i>, which is a randomly generated number within a pre-prescribed range 

