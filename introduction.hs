doubleMe :: Double -> Double
doubleMe x = x + x

doubleUs x y = doubleMe (x+y)

myMax a b = if a >= b then a else b

numbers1 = [1,3,5,8,14]
numbers2 = [2,3,12,13,42,5]
numbers3 = numbers1 ++ numbers2
caption = "hello" ++ " " ++ "world!"
-- But putting something at the end of a list that's fifty million entries long is going to take a while. 
-- However, putting something at the beginning of a list using the : operator (also called the cons operator) is instantaneous.
numbers1A = 1:3:5:8:14:[]
numbers2A = 2:numbers2

numberAt3InNumbers1 = numbers1 !! 3

-- First the heads are compared. If they are equal then the second elements are compared, etc.
res1 = [3,2,1] > [2,1,0] -- True
res2 = [3,2,1] > [2,10,100]  -- True
res3 = [3,4,2] > [3,4] -- True

-- You can't do [1,2,4,8,16..100] and expect to get all the powers of 2. Because you can only specify one step. 
list1 = [1..10]
list2 = [1,3..30]
list3 = [2,4..16]
list4 = [20,19..1]

take1 = take 24 [13,26..] -- Infinite list. Taking first 24 elements
take2 = take 10 (cycle [1,2,3])
take3 = take 10 (repeat 5)
replicateRes = replicate 3 12

comprehension1 = [x*2 | x <- [1..10]]
comprehension2 = [x | x <- [1..34], gcd x 34 == 1] -- list of x from range [1..34] for which gcd(x,34)==1
comprehension3 = [ x | x <- [10..20], x /= 13, x /= 15, x /= 19]  
comprehension4 = [ x*y | x <- [2,5,10], y <- [8,10,11]]  

length' xs = sum [1 | _ <- xs] 

-- A tuple can contain a combination of several types.
resultantVector (a,b) (c,d) = (a+c,b+d)
firstElementOFTuple = fst (4,6)
secondElementOfPair = snd (34,67) -- These functions operate only on pairs. They won't work on triples, 4-tuples, 5-tuples, etc.

zipping1 = zip [1 .. 5] ["one", "two", "three", "four", "five"] 
zipping2 = zip [1..] ["apple", "orange", "cherry", "mango"]  
zipping3 = zip [1 .. 4] ["a","b"]

rightTriangles = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2]  

ceilingOfSqrtOfIntegral :: (Integral a) => a -> a
ceilingOfSqrtOfIntegral n = ceiling (sqrt (fromIntegral n))
ceilingOfSqrtOfIntegral2 n = ceiling $ sqrt $ fromIntegral n

wordCount input = show (length (words input))
charactersCount input = show (length  input)
