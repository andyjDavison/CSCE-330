-- Andrew Davison
-- Chapter 7 Homework:
-- Question 5
curry' :: ((a, b) -> c) -> a -> b -> c
curry' f = \a b -> f (a, b)

uncurry' :: (a -> b -> c) -> (a, b) -> c
uncurry' f = \(a, b) -> f a b





-- Question 9
altMap :: (a -> b) -> (a -> b) -> [a] -> [b]
altMap _ _ [] = []
altMap f0 f1 (x:xs) = f0 x : altMap f1 f0 xs

-- *Main> altMap (+10) (+10) []
-- []
-- *Main> altMap (+10) (+10) [1]
-- [11]
-- *Main> altMap (+10) (+100) [1,2,3,57]
-- [11,102,13,157]
