-- task 40
plus = \y -> (\x -> x + y)
multiply = \y -> (\x -> x * y)
-- task 41
ff = (2 ^) -- 2 to the power of argument
gg = (^ 2) -- argument to the power of 2
-- task 42
t42_1 = map (^ 2) [1..5]
t42_2 = map (2 ^) [1..5]
-- task 43
f x y = (\x -> (\y -> x + 2 * y)) (x * y)
f_alpha x y = (\a -> (\b -> a + 2 * b)) (x * y)
f_beta x y =  \b -> (x * y) + 2 * b
-- taks 44
f0 = \x -> x * x
g0 = \y -> f0 (f0 y)
h0 = g0 . g0
g1 = f0 . f0
h1 = \x -> (x^4)^4
h2 = \x -> x^16
-- task 45
-- expression0 = (\x -> (x x))(\x -> x)
-- expression1 = (\a -> (a a))(\x -> x)
-- expression2 = (\x -> x) (\x -> x)
-- expression3 = (\x -> x) = identity
-- task 46
t46 = (head $ map (\x y -> (x * x) + (y * y) ) [2 ,3 ,4]) 5
t46_0help = map (\x -> x 5) (map (\x y -> (x * x) + (y * y) ) [2 ,3 ,4])
t46_1help = [2*2 + 5*5, 3*3 + 5*5, 4*4 + 5*5]
t46_1 = head t46_1help
-- task 47
-- s = (\f g x -> f x (g x)) 
-- k = (\x y -> x) -- const
-- i = (\x -> x) -- identity
-- S K K = I?
-- S K K = \f -> ( \g -> (\x -> f x (g x) )) K K = \g -> (\x -> K x (g x)) K
-- but K x (g x) = x so S = \g -> (\x -> x) K = \x -> x = i
