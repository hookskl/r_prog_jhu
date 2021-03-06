Scoping Rules - Symbol Binding
================

## A Diversion on the Binding Values to Symbol

How does R know which value to assign to which symbol?

``` r
lm <- function(x) {x * x}
lm
```

    ## function(x) {x * x}

Note that there already exists a function in R called `lm`. How does R
know what value to assign to the symbol `lm`? Why doesn’t it give it the
value of `lm` that is in the *stats* package?

When R tries to bind a value to a symbol, it searches through a series
of `environments` to find the appropriate value. When you are working on
the command line and need to retrieve the value of an R object, the
order is roughly

1.  Search the global environment for a symbol name matching the one
    requested.
2.  Search the namespaces of each of the packages on the search list.
    These are packages that have been loaded.

The search list can be found by using the `search` function.

``` r
search()
```

    ## [1] ".GlobalEnv"        "package:stats"     "package:graphics" 
    ## [4] "package:grDevices" "package:utils"     "package:datasets" 
    ## [7] "package:methods"   "Autoloads"         "package:base"

## Binding Values to Symbol

-   The *global environment* or the user’s workspace is always the first
    element of the search list and the *base* package is always the
    last.
-   The order of the packages on the search list matters!
-   User’s can configure which packages get loaded on startup so you
    cannot assume that there will be a set list of packages available.
-   When a user loads a package with `library` the namespace of that
    package gets put in position 2 of the search list (by default) and
    everything else gets shifted down the list.
-   Note that R has spearate namespaces for functions and non-functions
    so it’s possible to have an object named `c` and a function named
    `c`.

## Scoping Rules

The scoping rules for R are the main feature that makes it different
from the original S language.

-   The scoping rules determine how a value is associated with a free
    variable in a function
-   R uses *lexical scoping* or *static scoping*. A common alternative
    is *dynamic scoping*.
-   Related to the scoping rules is how R uses the search *list* to bind
    a value to a symbol
-   Lexical scoping turns out to be particularly useful for simplifying
    statistical computations

## Lexical Scoping

Consider the following:

``` r
f <- function(x, y) {
  x^2 + y / z
}
```

This function has 2 formal arguments `x` and `y`. In the body of the
function there is another symbol `z`. In this case `z` is called a *free
variable*. The scoping rules of a language determine how values are
assigned to free variables. Free variables are not formal arguments and
are not local variables (assigned inside the function body).

Lexical scoping in R means that

> the values of free variables are searched for in the environment in
> which the function was defined.

What is an environment?

-   An *environment* is a collection of (symbol, value) pairs, i.e. `x`
    is a symbol and `3.14` might be its value.
-   Every environment has a parent environment; it is possible for an
    environment to have multiple “children”.
-   The only environment without a parent is the empty environment.
-   A function + an environment = a *closure* or *function closure*.

Searching for a value for a free variable:

-   If the value of a symbol is not found in the environment in which a
    function was defined then the search is continued in the *parent
    environment*.
-   The search continues down the sequence of parent environments until
    we hit the *top-level environment*; this is usually the global
    environment (workspace) or the namespace of a package.
-   After the top-level environment, the search continues down the
    search list until we hit the *empty environment*. If a value for a
    given symbol cannot be found once the empty environment is arrived
    at then an error is thrown.

Why does this matter?

-   Typically, a function is defined in the global environment, so that
    the values of the free variables are just found in the user’s
    workspace.
-   This behavior is logical for most people and is usually the “right
    thing” to do.
-   However, in R you can have functions defined *inside other
    functions*:
    -   Languages like C do not allow this
-   Now things get interesting - in this case the environment in which a
    function is defined is the body of another function!

## Example

``` r
make.power <- function(n) {
  pow <- function(x) {
    x^n
  }
  pow
}
```

This function returns another function as its value.

``` r
cube <- make.power(3)
square <- make.power(2)
cube(3)
```

    ## [1] 27

``` r
square(3)
```

    ## [1] 9

## Exploring a Function Closure

What’s in a function’s environment?

``` r
ls(environment(cube))
```

    ## [1] "n"   "pow"

``` r
get("n", environment(cube))
```

    ## [1] 3

``` r
ls(environment(square))
```

    ## [1] "n"   "pow"

``` r
get("n", environment(square))
```

    ## [1] 2

## Lexical vs. Dynamic Scoping

``` r
y <- 10

f <- function(x) {
  y <- 2
  y^2 + g(x)
}

g <- function(x) {
  x*y
}
```

What is the value of `f(3)`?

-   With lexical scoping the value of `y` is the function `g` is looked
    up in the environment in which the function was defined, in this
    case the global environment, so the value of `y` is 10.
-   With dynamic scoping, the value of `y` is looked up in the
    environment from which the function was *called* (sometimes referred
    to as the *calling environment*).
    -   In R the calling environment is known as the *parent frame*
-   So the value of `y` would be 2.

When a function is *defined* in the global environment and *called* from
the global environment then the defining and calling environment are the
same.

``` r
g <- function(x) {
  a <- 3
  x + a + y
}
g(2) # throws an error
y <- 3
g(2) # outputs 8
```

## Other Languages

Other languages that support lexical scoping:

-   Scheme
-   Python
-   Perl
-   Common lisp

## Consequences of Lexical Scoping

-   In R, all objects must be stored in memory.
-   All functions must carry a pointer to their respective defining
    environments, which could be anywhere.
-   In S-PLUS, free variables are always looked up in the global
    workspace, so everything can be stored on the disk because the
    “defining environment” of all functions is the same.
