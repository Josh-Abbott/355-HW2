-- CptS 355 - Spring 2023 -- Homework2 - Haskell
-- Name: Josh Abbott
-- Collaborators: 

module HW2
     where

{- P1 - remove_every, remove_every_tail  -}

-- (a) remove_every – 7%

-- The issues I fixed in this function included:
-- Adjusting the line 1 function definition as the number of variables was incorrect.
-- Adjusting both original helper function lines to account for the incorrect number of variables as well.
-- Relocating and modifying the case for an empty table to the helper function.

remove_every n lst = remove_helper n lst
     where  
          remove_helper 0 (x:xs) = (remove_helper n xs)
          remove_helper _ [] = []
          remove_helper n (x:xs) = x:(remove_helper (n-1) xs) 

-- (b) remove_every_tail –  10%
remove_every_tail n lst = reverse (tail_helper [] n lst)
     where
          tail_helper acc 0 (_:ys) = tail_helper acc n ys
          tail_helper acc _ []     = acc
          tail_helper acc m (y:ys) = tail_helper (y:acc) (m-1) ys
          

------------------------------------------------------
{- P2  get_outof_range and count_outof_range  -}

-- (a) get_outof_range – 6%
get_outof_range v1 v2 xs = filter (\x -> x < v1 || x > v2) xs

-- (b) count_outof_range – 10%
count_outof_range :: Ord a => a -> a -> [[a]] -> Int
count_outof_range v1 v2 xss = sum $ map (\xs -> length $ get_outof_range v1 v2 xs) xss

------------------------------------------------------
{- P3  find_routes - 10% -}
find_routes :: String -> [(String, [String])] -> [String]
find_routes name routes =
     map fst $ filter (\(_, stops) -> elem name stops) routes

------------------------------------------------------
{- P4  add_lengths and add_nested_lengths -}
data LengthUnit = INCH Int | FOOT Int | YARD Int
                  deriving (Show, Read, Eq)

-- (a) add_lengths - 6%
add_lengths :: LengthUnit -> LengthUnit -> LengthUnit
add_lengths x y = INCH (toInches x + toInches y)
     where
          toInches :: LengthUnit -> Int
          toInches (INCH n) = n
          toInches (FOOT n) = 12 * n
          toInches (YARD n) = 36 * n

-- (b) add_nested_lengths - 10%
add_nested_lengths :: [[LengthUnit]] -> LengthUnit
add_nested_lengths = foldr add_lengths (INCH 0) . concat

------------------------------------------------------
{- P5 sum_tree and create_sumtree -}
data Tree a = NULL | LEAF a | NODE a (Tree a) (Tree a)
              deriving (Show, Read, Eq)

-- (a) sum_tree - 8%
sum_tree :: Num a => Tree a -> a
sum_tree NULL = 0
sum_tree (LEAF x) = x
sum_tree (NODE x l r) = x + sum_tree l + sum_tree r

-- (b) create_sumtree - 10%
create_sumtree :: Num a => Tree a -> Tree a
create_sumtree NULL = NULL
create_sumtree (LEAF x) = LEAF x
create_sumtree (NODE x l r) =
     let sumL = sum_tree l
         sumR = sum_tree r
         sumN = x + sumL + sumR
     in NODE sumN (create_sumtree l) (create_sumtree r)

------------------------------------------------------
{- P6 list_tree - 16% -}
data ListTree a = LEAFs [a] | NODEs [(ListTree a)]
                  deriving (Show, Read, Eq)

list_tree :: (a -> b -> b) -> b -> ListTree a -> b
list_tree f base (LEAFs xs) = foldr f base xs
list_tree f base (NODEs xs) = foldr (\tree acc -> list_tree f acc tree) base xs


-- Tree examples - 4%

-- We're not turning it in, but I've inserted both these tree examples into the test cases for P5a & P5b to help test the functions.
--int_t3 = (NODE 5 (NODE 2 (LEAF 3) (NODE 1 (LEAF 6) (LEAF 8))) (NODE 3 (LEAF 1) (NODE 4 (LEAF 7) (LEAF 2))))
--int_t4 = (NODE 10 (NODE 7 (LEAF 3) (NODE 6 (LEAF 2) (LEAF 4))) (NODE 8 (NODE 2 (LEAF 5) (NODE 3 (LEAF 1) NULL)) (LEAF 7)))

-- Assignment rules 3%