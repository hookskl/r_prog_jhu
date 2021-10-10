Simulation - Generating Random Numbers
================

## Generating Random Numbers

Functions for probability distributions in R

-   `rnorm`: generate random observations form a Normal distribution
    with a given mean and standard deviation
-   `dnorm`: evalute the Normal probability density (with a given
    mean/SD) at a point (or vector of points)
-   `pnorm`: evalute the cumulative distribution function for a Normal
    distribution
-   `rpois`: equivalent to `rnorm`, but for a Poisson distribution and
    given rate

Probability distribution functions usually have four functions
associated with them. The functions follow the convention “prefix +
distribution” where the prefix indicates a certain functionality and the
distrubtion indicates the probability distribution to simulate. The
prefixes are:

-   `d` for density
-   `r` for random number generation
-   `p` for cumulative distribution
-   `q` for quantile function

When performing simulations it’s important to use `set.seed`. This
ensures the simulation results can be preproduced.

``` r
set.seed(1)
rnorm(5)
```

    ## [1] -0.6264538  0.1836433 -0.8356286  1.5952808  0.3295078

``` r
rnorm(5)
```

    ## [1] -0.8204684  0.4874291  0.7383247  0.5757814 -0.3053884

``` r
set.seed(1)
rnorm(5)
```

    ## [1] -0.6264538  0.1836433 -0.8356286  1.5952808  0.3295078

Note that numbers generated in a simulation are not actually random,
they just *appear* random. These are also called *pseudorandom numbers*.
