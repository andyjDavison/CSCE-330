-- Andrew Davison
-- Chapter 6 Homework:
-- Question 4
euclid :: Int -> Int -> Int
euclid 1 _ = 1
euclid _ 1 = 1
euclid a b
  | a == b = a
  | a > b = euclid (a - b) b
  | otherwise = euclid (b - a) a

-- *Main> euclid 1 1
-- 1
-- *Main> euclid 1 4
-- 1
-- *Main> euclid 4 1
-- 1
-- *Main> euclid 5 5
-- 5
-- *Main> euclid 5 25
-- 5
-- *Main> euclid 25 5
-- 5
-- *Main> euclid 7 8
-- 1



-- Question 7
merge :: Ord a => [a] -> [a] -> [a]
merge a [] = a
merge [] b = b
merge (a:as) (b:bs)
  | a < b = a : merge as (b:bs)
  | otherwise = b : merge (a:as) bs

-- *Main> merge [1,2] []
-- [1,2]
-- *Main> merge [] [1,2]
-- [1,2]
-- *Main> merge [1,2,3] [4,5,6]
-- [1,2,3,4,5,6]
-- *Main> merge [1,4,5] [1]
-- [1,1,4,5]
-- *Main> merge [6,5,4] [3,2,1]
-- [3,2,1,6,5,4]




-- Question 8
halve :: [a] -> ([a], [a])
halve xs = splitAt ((length xs) `div` 2) xs

msort :: Ord a => [a] -> [a]
msort [] = []
msort [x] = [x]
msort xs = merge (msort left) (msort right)
  where
    (left, right) = halve xs

-- *Main> halve [1,2,3,4]
-- ([1,2],[3,4])
-- *Main> halve [1,2,3]
-- ([1],[2,3])
-- *Main> msort [3,2,66,2,7,1]
-- [1,2,2,3,7,66]
-- *Main> msort []
-- []
-- *Main> msort[1,2,3]
-- [1,2,3]