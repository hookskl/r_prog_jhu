Functions
================

## Functions

Functions are created using the `function()` directive and are stored as
R objects just like anything else. In particular, they are R objects of
class “function”.

``` r
f <- function(<arguments>) {
  ## do something 
}
```

Functions in R are “first class objects”, which means that they can be
treated much like any other R object. Importantly,

-   Functions can be passed as arguments to other functions
-   Functions can be nested, so that you can define a function inided of
    another function. The return value of a function is the last
    expression in the function body to be evaluated.

## Function Arguments

Functions have *named arguments* which potentially have *default
values*.

-   The *formal arguments* are the arguments included in the function
    definition
-   The `formals` function returns a list of all the formal arguments of
    a function
-   Not every function in R makes use of all the formal arguments
-   Function arguments can be *missing* or might have default values

## Argument Matching

R functions arguments can be matched positionally or by name. So the
following call to `sd` are all equivalent.

``` r
mydata <- rnorm(100)
sd(mydata)
sd(x = mydata)
sd(x = mydata, na.rm = FALSE)
sd(na.rm = FALSE, x = mydata)
sd(na.rm = FALSE, mydata)
```

Although R allows for changing the order of the arguments, it is not
recommened.

You can mix positional matching with matching by name. When an argument
is matched by name, it is “removed” from the argument list and the
remaining unnamed arguments are then matched in the order that they are
listed in the function definition.

``` r
args(lm)
```

    ## function (formula, data, subset, weights, na.action, method = "qr", 
    ##     model = TRUE, x = FALSE, y = FALSE, qr = TRUE, singular.ok = TRUE, 
    ##     contrasts = NULL, offset, ...) 
    ## NULL

The following are equivalent (again this is not recommended):

``` r
lm(data = mydata, y ~ x, model = FALSE, 1:100)
lm(y ~ x, mydata, 1:100, model = FALSE)
```

Most of the time, named arguments are useful on the command line when
you have a long argument list and you want to use the defaults for
everything except for an argument near the end of the list.

Named arguments also help if you can remember the name of the argument
and not its position in the argument list (`plot` is a good example of
this).

## Partial Matching

Function arguments can also be *partially* matched, which is useful for
interactive work. The order of the operations when given an argument is:

1.  Check for the exact match for a named argument
2.  Check for a partial match
3.  Check for a positional match

## Defining a Function

``` r
f <- function(a, b = 1, c = 2, d = NULL) {
  
}
```

In addition to not specifying a default value, you can also set an
argument value to `NULL`. This can represent many things, but generally
is used to signal “nothing is there”.

## Lazy Evaluation

Arguments to functions are evaluated *lazily*, so they are evaluated
only as needed.

``` r
f <- function(a, b) {
  a^2
}
f(2)
```

    ## [1] 4

This function never actually uses the argument `b`, so calling `f(2)`
will not produce an error because the 2 gets positionally matched to
`a`.

``` r
f <- function(a, b) {
  print(a)
  print(b)
}
f(45)
```

Notice that “45” got printed first before the error was triggered. This
is because the argument `b` was not evaluated until after `print(a)`.
Once the function tried to call `print(b)` the error triggered.

## The “…” Argument

The `...` argument indicates a variable number of arguments that are
usually passed on to other functions.

-   `...` is often used when extending another function and you don’t
    want to copy the entire argument list of the original function

``` r
myplot <- function(x, y, type = "l", ...) {
  plot(x, y, type = type, ...)
}
```

-   Generic functions use `...` so that extra arguments can be passed to
    methods

``` r
mean
```

    ## function (x, ...) 
    ## UseMethod("mean")
    ## <bytecode: 0x00000000159a36f0>
    ## <environment: namespace:base>

The `...` argument is also necessary when the number of arguments passed
to the function cannot be known in advance.

``` r
args(paste)
```

    ## function (..., sep = " ", collapse = NULL, recycle0 = FALSE) 
    ## NULL

``` r
args(cat)
```

    ## function (..., file = "", sep = " ", fill = FALSE, labels = NULL, 
    ##     append = FALSE) 
    ## NULL

## Arguments Coming After the “…” Argument

One catch with `...` is all arguments **after** must be named explicity
and cannot be partially matched.

``` r
paste("a", "b", sep = ":")
```

    ## [1] "a:b"

``` r
paste("a", "b", se = ":") # ignores partial matching
```

    ## [1] "a b :"
