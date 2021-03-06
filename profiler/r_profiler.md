R Profiler
================

## Why is My Code So Slow?

-   Profiling is a systematic way to examine how much time is spent in
    different parts of a program
-   Useful when trying to optimize your code
-   Often code runs fine once, but what if you have to put it in a loop
    for 1,000 iterations? Is it still fast enough?
-   Profilling is better than guessing

## On Optimizing Your Code

-   Getting biggest impact on speeding up code depends on knowing where
    the code spends spends most of its time
-   This cannot be done with performance analysis or profiling

> We should forget small efficiencies, say about 97% of the time:
> premature optimization is the root of all evil.
>
> –Donald Knuth

In other words, focus on writing code that works and is readable before
optimizing.

## General Principles of Optimization

-   Design first then optimize
-   Measure (collect data), don’t guess

## system.time()

-   `system.time()` takes an arbitray R expression as input (can be
    wrapped in `{}`) and returns the amount of time taken to evaluate
    the expression
-   Computes the time (in seconds) needed to execute an expression
    -   If there’s an error, gives time until error occurred
-   Returns an object of class `proc_time`
    -   **user time**: time charged to the CPU(s) for this expression
    -   **elapsed time**: “wall clock” time
-   Usually, the user time and elapsed time are close for straight
    computing tasks
-   Elapsed time may be *greater than* user time if the CPU spends a lot
    of time waiting around
-   Elapsed time may be *smaller than* user time if your machine has
    multiple cores (and is capable of using them)
    -   Multi-threaded BLAS libraries
    -   Parallel processing via the `parallel` package

## system.time() Examples

``` r
# elapsed time > user time
system.time(readLines("http://www.jhsph.edu"))
```

    ##    user  system elapsed 
    ##    0.10    0.13    0.94

``` r
# elapsed time < user time
hilbert <- function(n) {
  i <- 1:n
  1 / outer(i - 1, i, "+")
}
x <- hilbert(1000)
system.time(svd(x))
```

    ##    user  system elapsed 
    ##    2.72    0.01    2.88

## Timing Longer Expression

``` r
system.time({
  n <- 1000
  r <- numeric(n)
  for (i in 1:n) {
    x <- rnorm(n)
    r[i] <- mean(x)
  }
})
```

    ##    user  system elapsed 
    ##    0.11    0.00    0.11

## Beyond system.time()

`system.time()` is great when you know where the problem is occurring,
or you are working with a small block of code, but what if you don’t
know where to start?

## The R Profiler

-   The `Rprof()` function starts the profiler in R
    -   R must be compiled with profiler support (generally this is
        true)
-   The `summaryRprof()` function summarizes the output of `Rprof()`
    (it’s unreadable otherwise)
-   **DO NOT** use `system.time()` and `Rprof()` together!
-   `Rprof()` keeps track of the function call stack at regularly
    sampled intervals and tabulates how much time is spent in each
    function
-   Default sampling interval is 0.02 seconds
    -   Therefore if your code runs very quickly the profiler will not
        be useful

## Using summaryRprof()

-   The `summaryRprof()` function tabulates the R profiler output and
    calculates how much time is spent in which function
-   There are two methods for normalizing the data
-   `"by.total"` divides the time spent in each function by the total
    run time
-   `"by.self"` does the same but first subtracts out time spent in
    functions above in the call stack
