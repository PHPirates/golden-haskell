module GoldenSection where

import Data.Maybe (fromMaybe)

-- 1 / phi
invphi = (sqrt 5 - 1) / 2
-- 1 / phi^2
invphi2 = (3 - sqrt 5) / 2

-- | Enable optional arguments syntax. Use with Maybe a as parameter type, then in the function write param // defaultValue
(//) :: Maybe a -> a -> a
(//) = flip fromMaybe

-- | Golden section search, recursive.
-- Given a function f with a single local minimum in the interval [a, b], golden section search returns a subset interval [c, d] that contains the minimum with d-c <= tolerance
-- Taken from the python implementation at https://en.wikipedia.org/wiki/Golden-section_search
goldenSectionSearchRecursive :: (Float -> Float) -- ^ Function with a single minimum in [a, b]
                    -> Float -- ^ One side of the interval
                    -> Float -- ^ Other side of the interval
                    -> Float -- ^ Tolerance
                    -> Maybe Float -- ^ h, Current search interval
                    -> Maybe Float -- ^ c, New left interval point. If Nothing, a new point is chosen.
                    -> Maybe Float -- ^ d, New right interval point.
                    -> Maybe Float -- ^ f(c), Function value at c
                    -> Maybe Float -- ^ f(d), Function value at d
                    -> (Float, Float) -- ^ The interval in which the minimum is

goldenSectionSearchRecursive f a' b' tolerance h' c' d' fc' fd'
    | h < tolerance = (a, b)
    | fc < fd = goldenSectionSearchRecursive f a d tolerance (Just (h * invphi)) Nothing Nothing (Just c) (Just fc)
    | otherwise = goldenSectionSearchRecursive f c b tolerance (Just (h * invphi)) (Just d) (Just fd) Nothing Nothing
    where
        a = min a' b'
        b = max a' b'
        h = h' // (b - a)
        c = c' // a + invphi2 * h
        d = d' // a + invphi2 * h
        fc = fc' // f c
        fd = fd' // f d
