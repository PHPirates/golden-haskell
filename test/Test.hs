import Test.Tasty
import Test.Tasty.HUnit

import GoldenSection

-- run tests in terminal: stack test
main = defaultMain tests

tests :: TestTree
tests = testGroup "Tests" [
    function1
    ]

function1 = testGroup "Unit tests"
  [ testCase "Test (x-2)^2 convergence" $
    let result = goldenSectionSearch (\x -> (x-2)^2) 1 5 1e-5
    in (snd result - fst result) `compare` 1e-5 @?= LT
  , testCase "Test (x-2)^2 result" $
    let result = goldenSectionSearch (\x -> (x-2)^2) 1 5 1e-5
    in abs (2 - fst result) `compare` 1e-5 @?= LT
  , testCase "Test (x-2)^2 result" $
    let result = goldenSectionSearch (\x -> (x-2)^2) 1 5 1e-5
    in abs (2 - snd result) `compare` 1e-5 @?= LT
  ]