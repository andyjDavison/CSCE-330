-- Andrew Davison
-- Chapter 5
-- Question 5
pyths :: (Num c, Eq c, Enum c) => c -> [(c, c, c)]
pyths n =
  [ (x, y, z)
  | x <- [1 .. n]
  , y <- [1 .. n]
  , z <- [1 .. n]
  , x ^ 2 + y ^ 2 == z ^ 2
  ]

-- *Main> pyths 10
-- [(3,4,5),(4,3,5),(6,8,10),(8,6,10)]
-- *Main> pyths 48
-- [(3,4,5),(4,3,5),(5,12,13),(6,8,10),(7,24,25),(8,6,10),(8,15,17),(9,12,15),(9,40,41),(10,24,26),(12,5,13),(12,9,15),
-- (12,16,20),(12,35,37),(15,8,17),(15,20,25),(15,36,39),(16,12,20),(16,30,34),(18,24,30),(20,15,25),(20,21,29),(21,20,29),
-- (21,28,35),(24,7,25),(24,10,26),(24,18,30),(24,32,40),(27,36,45),(28,21,35),(30,16,34),(32,24,40),(35,12,37),(36,15,39),(36,27,45),(40,9,41)]


-- Question 6
factors :: Int -> [Int]
factors n = [x | x <- [1 .. n], n `mod` x == 0]

perfects :: Int -> [Int]
perfects n = [x | x <- [1 .. n], x == sum (factors x) - x]

-- *Main> factors 28
-- [1,2,4,7,14,28]
-- *Main> perfects 32
-- [6,28]
-- *Main> factors 500
-- [1,2,4,5,10,20,25,50,100,125,250,500]
-- *Main> perfects 500
-- [6,28,496]
