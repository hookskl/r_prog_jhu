Control Structures - Repeat, Next, Break
================

## repeat

`repeat` initiates an infinite loop; these are not commonly used in
statistical applications, but they do have their uses. The only way to
exit a `repeat` loop is to call `break`.

``` r
x0 <- 1
tol <- 1e-8

repeat {
  x1 <- computeEstimate() # not a real function
  
  if(abs(x1 - x0) < tol) {
    break
  } else {
    x0 <- x1
  }
}
```

The loop above is a bit dangerous because there’s no guarantee it will
stop. Typically a better idea to set a limit of iterations and then
report whether convergence was achieved or not.

## next, return

`next` is used to skip an iteration of a loop.

``` r
for(i in 1:100) {
  if(i <= 20) {
    ## skip the first 20 iterations
    next
  }
  ## do something
}
```

`return` signals that a function should exit and return a given value.
