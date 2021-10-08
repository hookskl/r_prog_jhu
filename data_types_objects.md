Data Types - R Objects and Attributes
================

## Objects

R has five basic or “atomic” classes of objects:

-   character
-   numeric (real numbers)
-   integer
-   complex
-   logical (True/False)

The most basic object is a vector

-   A vector can only contain objects of the *same* class
-   **BUT**: The one exception is a *list*, which is represented as a
    vector but can contain objects of different classes (indeed, that’s
    usually why we use them)

Empty vectors can be created with the `vector()` function.