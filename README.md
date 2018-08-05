[![Build Status](https://travis-ci.com/PHPirates/golden-haskell.svg?branch=master)](https://travis-ci.com/PHPirates/golden-haskell)
[![Coverage Status](https://coveralls.io/repos/github/PHPirates/golden-haskell/badge.svg?branch=master)](https://coveralls.io/github/PHPirates/golden-haskellt?branch=master)

# golden-haskell

A haskell implementation of the golden section function optimization method.

Golden section search is a good choice for one-dimensional, smooth and convex functions which have a single optimum and where the optimum is 'bracketed': an interval is known on which the optimum exists.

Interesting about this method is that the convergence rate is exactly known: on each iteration the length of the interval in which the optimum resides is divided by the golden ratio.
