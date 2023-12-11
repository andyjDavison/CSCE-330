-- Andrew Davison
-- Chapter 2:
-- Question 3
{-
 - N = a 'div' length xs
 -     where
 -        a = 10
 -        xs = [1,2,3,4,5]
 -}
n = a `div` (length xs)
    where
      a = 10
      xs = [1,2,3,4,5]
-- name should be lowercase
-- need backticks on div
-- parenthesis are needed around xs and length

-- Question 4
lastImplementation :: Num(a) => [a] -> a
lastImplementation (x) = head (reverse x)

-- Question 5
init1 :: Num a => [a] -> [a]
init1 x = take (length x - 1) x

init2 :: Num a => [a] -> [a]
init2 x = reverse (tail (reverse x))

-- Chapter 3:
-- Question 1
['a', 'b', 'c'] :: [Char]
('a', 'b', 'c') :: (Char, Char, Char)
[(False, 'O'), (True, '1')] :: [(Bool, Char)]
([False, True], ['0', '1']) :: ([Bool], [Char])
[tail, init, reverse] :: [[a] -> [a]]

-- Question 2
second :: [a] -> a
second xs = head (tail xs)

swap :: (a, b) -> (b, a)
swap (x, y) = (y, x)

pair :: a -> b -> (a, b)
pair x y = (x, y)

double :: Num a => a -> a
double x = x * 2

palindrome :: Eq a => [a] -> Bool
palindrome xs = reverse xs == xs

twice :: (a -> a) -> a -> a
twice f x = f(f x)

-- Question 4
--In order to check if two functions are equal, it is required enumerating all the possible 
--arguments and checking the output for each value. This way it is practically impossible to check functions equality.

--It could be feasible when the number of possible arguments is a known number, such as 
--functions that accepts Bool which only have two possible value.


