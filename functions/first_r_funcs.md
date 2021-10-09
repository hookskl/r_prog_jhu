Functions
================

## Your First Function

``` r
add2 <- function(x, y) {
  x + y
}
```

This simple function takes two arguments (`x` and `y`) and returns the
result of them added together.

``` r
add2(1, 2)
```

    ## [1] 3

``` r
add2(2, 3)
```

    ## [1] 5

## Another Function

``` r
above10 <- function(x) {
  use <- x > 10
  x[use]
}
```

This function takes (*assumes*) a numeric vector `x` as its input. It
then checks for values of the vector greater than 10 and returns a
subset vector of `x` whose values are all greater than 10.

The choice of 10 is arbitrary. Instead, what if we allowed to the user
to pick the threshold.

``` r
above <- function(x, n=10) {
  use <- x > n
  x[use]
}

x <- 1:20
above(x, 12)
```

    ## [1] 13 14 15 16 17 18 19 20

By adding a second argument, `n`, and replacing it where 10 was in the
logical check we now have a much more flexible function. Additionally,
note that `n=10` sets a default value to the argument. This is generally
a good idea to prevent errors in case a user calls `above(x)` without
specifying the value for `n`.

## More Complicated Function

``` r
columnmean <- function(y, removeNA = TRUE) {
  nc <- ncol(y)
  means <- numeric(nc)
  for(i in 1:nc) {
    means[i] <- mean(y[, i], na.rm = removeNA)
  }
  means
}

df <- data.frame(x = 1:3, y = 4:6)
columnmean(df)
```

    ## [1] 2 5
