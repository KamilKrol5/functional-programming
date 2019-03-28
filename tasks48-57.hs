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
myspantest1 = myspan (\n -> even n) [4,6,1,2,3,4,5]
-- task 49
ecd (x:xs) = map head (group xs)
-- task 50
