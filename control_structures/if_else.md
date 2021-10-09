Control Structures - If-else
================

## Control Structures: if

Note that `else` and `else if` are not required.

``` r
if(<condition>) {
  ## do something
} else {
  ## do something else
}
if(<condition>) {
  ## do something
} else if (<condition2>) {
  ## do something different
} else {
  ## do something else
}
```

## if

This is a valid if/else structure.

``` r
if(x > 3) {
  y <- 10
} else {
  y <- 0
}
```

So is this one.

``` r
y <- if(x > 3) {
  10
} else {
  0
}
```
