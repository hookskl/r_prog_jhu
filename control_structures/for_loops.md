Control Structures - For loops
================

## for

`for` loops take an iterator variable and assign it successive values
from a sequence or vector. For loops are most commonly used for
iterating over the elements of an object (list, vector, etc.).

``` r
for(i in 1:10) {
  print(i)
}
```

    ## [1] 1
    ## [1] 2
    ## [1] 3
    ## [1] 4
    ## [1] 5
    ## [1] 6
    ## [1] 7
    ## [1] 8
    ## [1] 9
    ## [1] 10

This loop takes the `i` variable and in each iteration of the loop gives
it values 1, 2, 3, …, 10, and then exits.

These three loops have the same behavior.

``` r
x <- c("a", "b", "c", "d")

# more traditional for loop structure
for(i in 1:4) {
  print(x[i])
}
# similar to above, but use seq_along to generate 
# integer sequence based on variable iterating over
for(i in seq_along(x)) {
  print(x[i])
}
# more pythonic for loop
for(letter in x) {
  print(letter)
}

# more compact, note that {} aren't required
for(letter in x) print(letter)
```

## Nested for loops

`for` loops can be nested.

``` r
x <- matrix(1:6, 2, 3)

for(i in seq_len(nrow(x))) {
  for(j in seq_len(ncol(x))) {
    print(x[i, j])
  }
}
```

    ## [1] 1
    ## [1] 3
    ## [1] 5
    ## [1] 2
    ## [1] 4
    ## [1] 6

Generally speaking, nesting loops beyond 2-3 levels is not a good idea.
