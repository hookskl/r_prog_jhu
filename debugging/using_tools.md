Debugging Tools - Using the Tools
================

## traceback

``` r
mean(x)
traceback()
```

This will result in an error because `x` has not been defined and cannot
be found in the environment. When calling `traceback()` `1: mean(x)`
will be printed to the console, indicating this is where the error
occurred.

Note that `traceback()` must be called immediately after the error
occurred.

Another example with more complicated results:

``` r
lm(y ~ x)
traceback()
```

Again, calling `lm` will result in an error because `y` has not been
defined. But now when using `traceback()` we see the error occurred
seven levels deep.

    7: eval(predvars, data, env)
    6: eval(predvars, data, env)
    5: model.frame.default(formula = y ~ x, drop.unused.levels = TRUE)
    4: stats::model.frame(formula = y ~ x, drop.unused.levels = TRUE)
    3: eval(mf, parent.frame())
    2: eval(mf, parent.frame())
    1: lm(y ~ x)

## debug

``` r
debug(lm)
lm(y ~ x)
```

This will bring up the entire source code of the function in “browser”
mode, allowing the user to move through the source code, executing line
by line until the error occurs. Below is truncated output from the
debugger.

    debugging in: lm(y ~ x)
    debug: {
        ret.x <- x
        ret.y <- y
        cl <- match.call()
        mf <- match.call(expand.dots = FALSE)
        m <- match(c("formula", "data", "subset", 
            "weights", "na.action", "offset"), 
            names(mf), 0L)

## recover

Calling `options(error = recover)` sets a global option in the
environment for the entire R session. After an error occurs the user is
prompted with a menu similar to the traceback that can be used to browse
where the error occurred.
