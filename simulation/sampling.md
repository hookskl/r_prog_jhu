Simulation - Random Sampling
================

## Random Sampling

The `sample` function draws randomly from a specified set of (scalar)
objects allowing you to sample form arbitray distributions.

``` r
set.seed(1)
sample(1:10, 4) # sample 4 objects from the vector 1 to 10, without replacement
```

    ## [1] 9 4 7 1

``` r
sample(1:10, 4)
```

    ## [1] 2 7 3 6

``` r
sample(letters, 5)
```

    ## [1] "r" "s" "a" "u" "w"

``` r
sample(1:10) # permutation
```

    ##  [1] 10  6  9  2  1  5  8  4  3  7

``` r
sample(1:10)
```

    ##  [1]  5 10  2  8  6  1  4  3  9  7

``` r
sample(1:10, replace = TRUE) # sample w/replacement
```

    ##  [1]  3  6 10 10  6  4  4 10  9  7
