-- returns 3rd element of the list
third :: [a] -> a
third (_:_:x:xs) = x
third (_:_:_) = error "list size is 2" -- list size higher than 2 is handled above
third _ = error "no third position" -- list size smaller than 2

data Pair --type declaration, Pair is type constructor 
    = MakePair Int Int --value constructor, this one takes 2 Ints
    deriving (Show)
p :: Pair
p = MakePair 1 2

getFirst :: Pair -> Int
getFirst (MakePair x _) = x

getSum :: Pair -> Int
getSum (MakePair x y) = x + y

data Bool2 = True2 | False2
isTrue2 :: Bool2 -> Bool
isTrue2 True2 = True
isTrue2 _ = False

data GenericPair a = MakeGenericPair a a -- template with type a
                     deriving (Show)
getFirstGeneric :: GenericPair a -> a
getFirstGeneric (MakeGenericPair x _) = x

firstPair = getFirstGeneric $ MakeGenericPair (MakePair 7 6)  (MakePair 86 2)

data Tree a = Leaf a | TreeNode a (Tree a) (Tree a) deriving (Show) -- generic binary tree
t :: Tree Int
t = TreeNode 1 (TreeNode 2 (Leaf 5) (Leaf 7)) (Leaf 8)

data LinkedList a = Node a (LinkedList a) | End deriving (Show)
list = Node 6 (Node 7 (Node 9 End))

data LinkedList2 a = Head2 (LinkedList2 a) | a `Node2` (LinkedList2 a) | End2
infixr `Node2`
list2 = Head2 (6 `Node2` 7 `Node2` 9 `Node2` End2)

instance (Show a) => Show (LinkedList2 a) where
    show End2 = "⁅⁆"
    show (Head2 x) = "⁅" ++ show x
    show (x `Node2` End2) = show x ++ "⁆"
    show (x `Node2` y) = show x ++ "," ++ show y

list3 = 6 : 7 : 9 : [] -- == [6,7,9]
