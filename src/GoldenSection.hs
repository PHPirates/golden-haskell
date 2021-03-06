module GoldenSection (goldenSectionSearch) where

import Data.Maybe (fromMaybe)
--import Debug.Trace (trace)

-- 1 / phi
invphi = (sqrt 5 - 1) / 2
-- 1 / phi^2
invphi2 = (3 - sqrt 5) / 2

-- | Enable optional arguments syntax. Use with Maybe a as parameter type, then in the function write param // defaultValue
(//) :: Maybe a -> a -> a
(//) = flip fromMaybe

-- | Golden section search, recursive.
-- Given a function f with a single local maximum in the interval [a, b], golden section search returns a subset interval [c, d] that contains the maximum with d-c <= tolerance
goldenSectionSearch ::
    (Double -> Double) -- ^ Function with a single maximum in [a, b]
    -> Double -- ^ One side of the interval
    -> Double -- ^ Other side of the interval
    -> Double -- ^ Tolerance
    -> (Double, Double) -- ^ The interval in which the maximum is

-- Just a wrapper function because of all the ugly Nothing's of the recursive function
goldenSectionSearch f a b tolerance = goldenSectionSearchRecursive f a b tolerance Nothing Nothing Nothing Nothing Nothing

-- | Golden section search, recursive.
-- Given a function f with a single local maximum in the interval [a, b], golden section search returns a subset interval [c, d] that contains the maximum with d-c <= tolerance
-- Taken from the python implementation at https://en.wikipedia.org/wiki/Golden-section_search
goldenSectionSearchRecursive ::
    (Double -> Double) -- ^ Function with a single maximum in [a, b]
    -> Double -- ^ One side of the interval
    -> Double -- ^ Other side of the interval
    -> Double -- ^ Tolerance
    -> Maybe Double -- ^ h, Current search interval
    -> Maybe Double -- ^ c, New left interval point. If Nothing, a new point is chosen.
    -> Maybe Double -- ^ d, New right interval point.
    -> Maybe Double -- ^ f(c), Function value at c
    -> Maybe Double -- ^ f(d), Function value at d
    -> (Double, Double) -- ^ The interval in which the maximum is

-- For debugging, prints all function calls
--goldenSectionSearchRecursive f a' b' tolerance h' c' d' fc' fd' | trace ("myfun a=" ++ show a' ++ " b=" ++ show b' ++ " h=" ++ show h' ++ " c=" ++ show c' ++ " d=" ++ show d' ++ " fc=" ++ show fc' ++ " fd=" ++ show fd') False = undefined
goldenSectionSearchRecursive f a' b' tolerance h' c' d' fc' fd'
    | h < tolerance = (a, b)
    | fc > fd = goldenSectionSearchRecursive f a d tolerance (Just (h * invphi)) Nothing (Just c) Nothing (Just fc)
    | otherwise = goldenSectionSearchRecursive f c b tolerance (Just (h * invphi)) (Just d) Nothing (Just fd) Nothing
    where
        a = min a' b'
        b = max a' b'
        h = h' // (b - a)
        c = c' // (a + invphi2 * h)
        d = d' // (a + invphi * h)
        fc = fc' // f c
        fd = fd' // f d
