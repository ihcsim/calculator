# Calculator

## Introduction
Challenged by Robert (Uncle Bob) Martin's Clean Code [Episode 23: "Mocking - Part 1"](http://cleancoders.com/episode/clean-code-episode-23-p1/show) and [Episode 24: "Mocking - Part 2"](http://cleancoders.com/episode/clean-code-episode-23-p2/show), and [XUnit Patterns](http://xunitpatterns.com/), this is my attempt to explore and write unit tests for arithmetic algorithms with a large set of inputs permutations. 

**How would one go about unit testing the addition, subtraction, multiplication and division functions, given their seemingly infinite inputs permutations? At what one point do one consider there is sufficient test coverage for both the normal and edge cases? How does one test *everything*?**

## Test Strategy And Implementation Patterns
In addition to a set of *statism specs*, I attempted to use the [test spy](http://xunitpatterns.com/Test%20Spy.html) pattern to verify the specs of the arithmetic operations of addition, subtraction, multiplication and division, by ensuring the *core* steps of the operations are invoked in the right place, at the right time. 

Using the *test spy* pattern in a test-first and test-driven manner surfaces a few interesting implementation patterns:

### Separation Of Concrete Implementation From Abstract Concept
Instead of calling the ruby native arithmetic operations within my calculator class, *my specs drive* me to extract out the operations into an `Arithmetic` mixin. Separating details of these concrete implementations from my `Calculator` class permits me to swap implementation details at-will. For example, I can now implement a bit-shift mixin to perform the same set of arithmetic operations.

### Breakdown Of Algorithm Core Steps
To enable my *test spy* to spy the correctness of the arithmetic operations, the operations are further broken down into more granular atomic functions such as `increment`. The *test spy* will ensure that this core step is invoked at the right time, and in the right place.

### Test Spy Must Failed Specs If Arithemtic Operation Is Altered
The *test spy* is tightly coupled with its corresponding arithmetic operation by design. If the operation is altered, the spy tests shall fail. Otherwise, the *test spy* fails in its purpose of validating the steps of the algorithm.

##To Run
To execute the specs, execute <code>$ rspec spec/* --format d</code>

## Contact
Follow me on [Twitter](https://twitter.com/IvanHCSim).
