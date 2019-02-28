-- task 3
euler n = length [k | k <- [1..n], gcd k n == 1]
myFilter k n = gcd k n == 1
euler2 n = (length . filter (myFilter n)) [1..n]
sumUsingeuler :: Int -> Int
sumUsingeuler n = sum [euler k | k <- [1..n], n `mod` k == 0]
-- task 4
pythagoreanTriples n = [ (a,b,c) | a <- [1..n], b <- [1..a], c <- [1..a], a^2 == b^2 + c^2 && gcd b c == 1]
-- task 5
fib1 0 = 0
fib1 1 = 1
fib1 n = fib1 (n-2) + fib1 (n-1)

fib2 n | n == 0 = 0
       | n == 1 = 1
       | otherwise = fib2 (n-2) + fib2 (n-1)

fibs :: [Integer]
fibs = 1 : 1 : zipWith (+) fibs (tail fibs)
fib3 n = fibs !! n
-- task 6
choose _ 0 = 1
choose n k = n * (choose (n-1) (k-1)) `div` k
--task 7
perfects :: [Integer]
perfects = [ x | x <- [2..], sum [ d | d <- [1..(x - 1)], x `mod` d == 0] == x]
