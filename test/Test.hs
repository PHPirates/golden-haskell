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
        let result = goldenSectionSearch (\x -> -(x-2)^2) 1 5 1e-5
        in (snd result - fst result) `compare` 1e-5 @?= LT
      , testCase "Test -(x-2)^2 fst result" $
        let result = goldenSectionSearch (\x -> -(x-2)^2) 1 5 1e-5
        in abs (2 - fst result) `compare` 1e-5 @?= LT
      , testCase "Test -(x-2)^2 snd result" $
        let result = goldenSectionSearch (\x -> -(x-2)^2) 1 5 1e-5
        in abs (2 - snd result) `compare` 1e-5 @?= LT
      ]

cosfunction =
    testGroup
        "Test a cosine"
        [ testCase "Test cos x convergence" $
          let result = goldenSectionSearch (\x -> cos (x - pi / 2)) (-pi / 2) (pi / 2) 1e-5
           in (snd result - fst result) `compare` 1e-5 @?= LT
        , testCase "Test cos x fst result" $
          let result = goldenSectionSearch (\x -> cos (x - pi / 2)) (-pi / 2) (pi / 2) 1e-5
           in abs (pi / 2 - fst result) `compare` 1e-5 @?= LT
        , testCase "Test cos x snd result" $
          let result = goldenSectionSearch (\x -> cos (x - pi / 2)) (-pi / 2) (pi / 2) 1e-5
           in abs (pi / 2 - snd result) `compare` 1e-5 @?= LT
        ]

complicated =
    testGroup
        "Test a complicated function"
        [ testCase "Test complicated convergence" $
          let result = goldenSectionSearch (\x -> 0.29 + 0.92 * exp (-0.42 / cos (x - pi / 4)) ) (-pi / 5) (pi / 3) 1e-5
           in (snd result - fst result) `compare` 1e-5 @?= LT
        , testCase "Test complicated fst result" $
          let result = goldenSectionSearch (\x -> 0.29 + 0.92 * exp (-0.42 / cos (x - pi / 4)) ) (-pi / 5) (pi / 3) 1e-5
           in abs (pi / 4 - fst result) `compare` 1e-5 @?= LT
        , testCase "Test complicated snd result" $
          let result = goldenSectionSearch (\x -> 0.29 + 0.92 * exp (-0.42 / cos (x - pi / 4)) ) (-pi / 5) (pi / 3) 1e-5
           in abs (pi / 4 - snd result) `compare` 1e-5 @?= LT
        ]