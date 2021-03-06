Control Structures - While loops
================

## while

`while` loops begin by testing a condition. If it is `TRUE` then they
execute the loop body. Once the loop body is executed, the condition is
tested again, repeating the loop until the condition returns `FALSE`.

``` r
count <- 0
while(count < 10) {
  print(count)
  count <- count + 1
}
```

    ## [1] 0
    ## [1] 1
    ## [1] 2
    ## [1] 3
    ## [1] 4
    ## [1] 5
    ## [1] 6
    ## [1] 7
    ## [1] 8
    ## [1] 9

Worth nothing that `while` loops can run indefinitely if not written
carefully.

Sometimes there will be more than one condition in the test.

``` r
z <- 5

while(z >= 3 && z <= 10) {
  print(z)
  coin <- rbinom(1, 1, 0.5)
  
  if(coin == 1) { ## random walk
    z <- z + 1
  } else {
    z <- z - 1
  }
}
```

    ## [1] 5
    ## [1] 4
    ## [1] 5
    ## [1] 6
    ## [1] 5
    ## [1] 4
    ## [1] 3
    ## [1] 4
    ## [1] 3
    ## [1] 4
    ## [1] 3
    ## [1] 4
    ## [1] 3

Conditions are always evaluated from left to right.
