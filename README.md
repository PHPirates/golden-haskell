[![Build Status](https://travis-ci.com/PHPirates/golden-haskell.svg?branch=master)](https://travis-ci.com/PHPirates/golden-haskell)
[![Coverage Status](https://coveralls.io/repos/github/PHPirates/golden-haskell/badge.svg?branch=master)](https://coveralls.io/github/PHPirates/golden-haskellt?branch=master)

# golden-haskell

A haskell implementation of the golden section function optimization method.

Golden section search is a good choice for one-dimensional, smooth and convex functions which have a single optimum and where the optimum is 'bracketed': an interval is known on which the optimum exists.

Interesting about this method is that the convergence rate is exactly known: on each iteration the length of the interval in which the optimum resides is divided by the golden ratio.

## Usage

1. Add to your `stack.yaml`
    ```yaml
    extra-deps:
    - github: PHPirates/golden-haskell
      commit: "ff69e9d"
    ```
    If after step 2 you get an error, you can try the older syntax
    ```yaml
    extra-deps:
    - git: git@github.com:PHPirates/golden-haskell.git
      commit: "ff69e9d"
    ```
2. Add in the appropriate section in your `.cabal` file to `build-depends` the dependency `golden-haskell`.

3. Use with
```haskell
import GoldenSection (goldenSectionSearch)

-- Function to optimize
f = \x -> -(x-2)^2
-- Find the maximum in [a, b]
a = 1
b = 5
-- Tolerance, the result interval should have a length smaller than this
tolerance = 1e-5
-- The result is an interval in which the maximum has to be
result :: (Double, Double)
result = goldenSectionSearch f a b tolerance
```
