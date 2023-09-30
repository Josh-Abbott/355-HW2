module P5b_HW2tests
    where

import Test.HUnit
import Data.Char
import Data.List (sort)
import HW2


int_t1 = (NODE 8 (NODE 0 (LEAF 4) (NODE 4 NULL (LEAF 9))) (NODE 0 (NODE 0 (LEAF 10) (NODE 7 NULL (LEAF 13)))  NULL))
int_t2 = (NODE 0 (NODE 10 (LEAF 4)  NULL) (NODE (-10) (NODE (-3) NULL  (NODE 10 NULL (LEAF (-3)))) (LEAF (-4))))
int_t3 = (NODE 5 (NODE 2 (LEAF 3) (NODE 1 (LEAF 6) (LEAF 8))) (NODE 3 (LEAF 1) (NODE 4 (LEAF 7) (LEAF 2))))
int_t4 = (NODE 10 (NODE 7 (LEAF 3) (NODE 6 (LEAF 2) (LEAF 4))) (NODE 8 (NODE 2 (LEAF 5) (NODE 3 (LEAF 1) NULL)) (LEAF 7)))

sum_t1_output = NODE 55 (NODE 17 (LEAF 4) (NODE 13 NULL (LEAF 9))) (NODE 30 (NODE 30 (LEAF 10) (NODE 20 NULL (LEAF 13))) NULL)
sum_t2_output = (NODE 4 (NODE 14 (LEAF 4)  NULL) (NODE (-10) (NODE 4 NULL  (NODE 7 NULL (LEAF (-3)))) (LEAF (-4))))
sum_t3_output = NODE 42 (NODE 20 (LEAF 3) (NODE 15 (LEAF 6) (LEAF 8))) (NODE 17 (LEAF 1) (NODE 13 (LEAF 7) (LEAF 2)))
sum_t4_output = NODE 58 (NODE 22 (LEAF 3) (NODE 12 (LEAF 2) (LEAF 4))) (NODE 26 (NODE 11 (LEAF 5) (NODE 4 (LEAF 1) NULL)) (LEAF 7))

{- create_sumtree tests  -}
p5b_test1 = TestCase (assertEqual "create_sumtree test-1" 
                                   sum_t1_output 
                                   (create_sumtree int_t1) ) 
p5b_test2 = TestCase (assertEqual "create_sumtree  test-2" 
                                   sum_t2_output 
                                   (create_sumtree int_t2) ) 
p5b_test3 = TestCase (assertEqual "create_sumtree  test-3" 
                                   sum_t3_output 
                                   (create_sumtree int_t3) ) 
p5b_test4 = TestCase (assertEqual "create_sumtree  test-4" 
                                   sum_t4_output 
                                   (create_sumtree int_t4) ) 

tests = TestList [ TestLabel "Problem 5b - test1 " p5b_test1,
                   TestLabel "Problem 5b - test2 " p5b_test2,
                   TestLabel "Problem 5b - test3 " p5b_test3,
                   TestLabel "Problem 5b - test4 " p5b_test4

                 ]
                  

-- shortcut to run the tests
run = runTestTT  tests