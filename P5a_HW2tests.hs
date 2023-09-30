module P5a_HW2tests
    where

import Test.HUnit
import Data.Char
import Data.List (sort)
import HW2

-- Sample Tree Int examples given in the assignment prompt; make sure to provide your own tree examples in HW2Tests.hs file.
-- Your trees should have minimum 4 levels (including the leaves). 

int_t1 = (NODE 8 (NODE 0 (LEAF 4) (NODE 4 NULL (LEAF 9))) (NODE 0 (NODE 0 (LEAF 10) (NODE 7 NULL (LEAF 13)))  NULL))
int_t2 = (NODE 0 (NODE 10 (LEAF 4)  NULL) (NODE (-10) (NODE (-3) NULL  (NODE 10 NULL (LEAF (-3)))) (LEAF (-4))))
int_t3 = (NODE 5 (NODE 2 (LEAF 3) (NODE 1 (LEAF 6) (LEAF 8))) (NODE 3 (LEAF 1) (NODE 4 (LEAF 7) (LEAF 2))))
int_t4 = (NODE 10 (NODE 7 (LEAF 3) (NODE 6 (LEAF 2) (LEAF 4))) (NODE 8 (NODE 2 (LEAF 5) (NODE 3 (LEAF 1) NULL)) (LEAF 7)))

{- sum_tree tests  -}
p5a_test1 = TestCase (assertEqual "sum_tree test-1" 
                                   55 
                                   (sum_tree int_t1) ) 
p5a_test2 = TestCase (assertEqual "sum_tree  test-2" 
                                   4 
                                   (sum_tree int_t2) ) 
p5a_test3 = TestCase (assertEqual "sum_tree  test-3" 
                                   42
                                   (sum_tree int_t3) ) 
p5a_test4 = TestCase (assertEqual "sum_tree  test-4" 
                                   58
                                   (sum_tree int_t4) ) 


tests = TestList [ TestLabel "Problem 5a - test1 " p5a_test1,
                   TestLabel "Problem 5a - test2 " p5a_test2,
                   TestLabel "Problem 5a - test3 " p5a_test3,
                   TestLabel "Problem 5a - test4 " p5a_test4
                 ]
                  

-- shortcut to run the tests
run = runTestTT  tests