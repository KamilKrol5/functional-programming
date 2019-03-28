import Data.List (partition, group)
-- task 20
x = 5 :: Int
y1 = fromIntegral 5 ::Float
y2 = fromInteger 6 ::Double
-- task 22
nfib :: Int -> Int
fib = 1:1:zipWith (+) fib (tail fib)
nfib n = fib !! n
-- task 23
middle1 :: Int -> Int -> Int -> Int
middle1 x y z = [ d | d <- [x,y,z], d /= maximum [x,y,z] && d/= minimum [x,y,z]] !! 0
middle2 :: Int -> Int -> Int -> Int
middle2 x y z = qsLecture [x,y,z] !! 1 -- using quick sort
-- task 24
qsLecture :: Ord t => [t] -> [t]
qsLecture []     = []
qsLecture (x:xs) = qsLecture [t| t <- xs, t < x] ++ [x] ++ qsLecture [t| t <- xs, t > x] 
qsBetter :: Ord t => [t] -> [t]
qsBetter []     = []
qsBetter (x:xs) = qsBetter left ++ [x] ++ qsBetter right -- doing only one comparison per element
    where (left,right) = partition(<x) xs
-- task 25
inits :: [a] -> [[a]]
inits [] = [[]]
inits xs = inits (init xs) ++ [xs]
inits2 xs = (inits . init $ xs) ++ [xs]
-- task 26
subsets [] = [[]]
subsets (x:xs) = map (x:) (subsets xs) ++ subsets xs
partitions [] = []
partitions xs = [ (x,y) | x <- subs, y <- subs, x ++ y == xs]
    where subs = subsets xs
-- task 27
nub (x:xs) = map head (group xs) -- not working for repetitive values
nub2 (x:xs) = (map head . group) xs -- not working for repetitive values
nub3 [] = []
nub3 (x:xs) = [t | t <- x:xs, not (t `elem` xs) ] ++ nub3 xs
-- task 28
-- task 29
zeros n 
    | n `div` 5 == 0 = 0
    | otherwise = n `div` 5 + zeros (n `div` 5)
