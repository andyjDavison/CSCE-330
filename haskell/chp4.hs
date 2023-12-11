-- Andrew Davison
-- Chapter 4:
-- Question 8
luhnDouble :: Int -> Int
luhnDouble x =
  if x * 2 > 9
    then x * 2 - 9
    else x * 2

luhn :: Int -> Int -> Int -> Int -> Bool
luhn a b c d = (luhnDouble a + b + luhnDouble c + d) `mod` 10 == 0

-- *Main> luhn 9 0 1 9
-- True
-- *Main> luhn 1 2 3 4
-- False