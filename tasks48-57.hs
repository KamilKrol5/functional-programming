import Data.List (group)
-- task 48
testSpan1 = span (\n -> even n) [8,2,12,5,56]
testSpan2 = span (\n -> even n) [1,8,2,12,5,56]
myspan :: (x -> Bool) -> [x] -> ([x],[x])
myspan _ [] = ([],[])
myspan pred (x:xs) = let 
                        cond = pred x
                        y = if cond then [x] else []
                        z = if not cond then [x] else []
                        p = if cond then pred else (\x -> False) 
                        (ys,zs) = myspan p xs
                        in (y++ys,z++zs)

myspan2 :: (x -> Bool) -> [x] -> ([x],[x])
myspan2 _ [] = ([],[])
myspan2 pred (x:xs) = let 
                        cond = pred x
                        (ys, zs) = if cond then myspan2 pred xs else ([],xs)
                        -- ys' = if cond then x:ys else ys
                        -- zs' = if not cond then x:zs else zs
                        -- (ys',zs') if cond then (x:ys,zs) else (ys,x:zs)
                        -- in (ys',zs')
                        in if cond then (x:ys,zs) else (ys,x:zs)

myspantest1 = myspan (\n -> even n) [4,6,1,2,3,4,5]
-- task 49
ecd1 xs = map head (group xs)
ecd2 [] = []
ecd2 xs@[x] = xs
ecd2 (y:xd@(x:xs)) | y == x = ecd2 xd --(x:xs)
                   | otherwise = y : (ecd2 xd) --(x:xs))
-- task 50
pack1 [] = []
pack1 (x:xs) = helper [x] xs []
               where helper xs [] x = x ++ [xs]
                     helper current (y:ys) acc | head current == y = helper (current ++ [y]) ys acc
                                               | otherwise = helper [y] ys (acc ++ [current])
pack2 [] = []
pack2 xs'@(x:xs) = same : (pack2 rest)
                   where (same, rest) = span (==x) xs'
-- task 51
rleEncode xs = map f (group xs)
               where f x = (length x,head x)
rleDecode xs = (concat . map f) xs
               where f (len, x) = replicate len x

rleDecode2 xs = concat . map (uncurry replicate) $ xs
-- uncurry :: (a -> b -> c) -> ((a, b) -> c)
-- task 52
evens xs = foldr f 0 xs
           where f x y | even x = y+1
                       | otherwise = y
-- task 53
l = [1,2,3,4,5,6]
s = sum l
p = product l
allTest1 = all even l
allTest2 = all even [2,4..10]
anyTest1 = any even l
anyTest2 = any even [1,3,5,7,9]