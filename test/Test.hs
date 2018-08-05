import Test.Tasty
import Test.Tasty.HUnit

import GoldenSection

-- run tests in terminal: stack test
main = defaultMain tests

tests :: TestTree
tests = testGroup "Tests" [
    quadratic
  , cosfunction
  , complicated
    ]

quadratic =
    testGroup
        "Test a quadratic function"
      [ testCase "Test -(x-2)^2 convergence" $
        (snd result - fst result) `compare` 1e-5 @?= LT
      , testCase "Test -(x-2)^2 fst result" $
        abs (2 - fst result) `compare` 1e-5 @?= LT
      , testCase "Test -(x-2)^2 snd result" $
        abs (2 - snd result) `compare` 1e-5 @?= LT
      ]
      where result = goldenSectionSearch (\x -> -(x-2)^2) 1 5 1e-5

cosfunction =
    testGroup
        "Test a cosine"
        [ testCase "Test cos x convergence" $
          (snd result - fst result) `compare` 1e-5 @?= LT
        , testCase "Test cos x fst result" $
          abs (pi / 2 - fst result) `compare` 1e-5 @?= LT
        , testCase "Test cos x snd result" $
          abs (pi / 2 - snd result) `compare` 1e-5 @?= LT
        ]
        where result = goldenSectionSearch (\x -> cos (x - pi / 2)) (-pi / 2) (pi / 2) 1e-5

complicated =
    testGroup
        "Test a complicated function"
        [ testCase "Test complicated convergence" $
           (snd result - fst result) `compare` 1e-5 @?= LT
        , testCase "Test complicated fst result" $
          abs (pi / 4 - fst result) `compare` 1e-5 @?= LT
        , testCase "Test complicated snd result" $
          abs (pi / 4 - snd result) `compare` 1e-5 @?= LT
        ]
        where result = goldenSectionSearch (\x -> 0.29 + 0.92 * exp (-0.42 / cos (x - pi / 4)) ) (-pi / 5) (pi / 3) 1e-5
