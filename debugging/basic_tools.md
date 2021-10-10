Debugging Tools - Basic Tools
================

## Debugging Tools in R

The primary tools for debugging functions in R are

-   `traceback`: prints out the function call stack after an error
    occurs; nothing if there’s no error
-   `debug`: flags a function for “debug” mode which allows you to step
    through the execution of a function one line at a time
-   `browser`: suspends the execution of a function wherever it is
    called and puts the function in debug mode
-   `trace`: allows you to insert debugging code into a function at
    specific places
-   `recover`: allows you to modify the error behavior so that you can
    browse the function call stack

These are interactive tools specifically designed to allow you to pick
through a function. There’s also the most blunt technique of inserting
print/cat statements in the function.
