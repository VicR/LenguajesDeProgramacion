-- Víctor Rendón Suárez | A01022462

--Problema 1---------------------------------------------------------------------
modulos :: Int -> [Int]
modulos n = map (mod n) [1..20]

mcm :: [Int] -> Bool
mcm numbers = all (== 0) numbers
prob1 = head (filter (mcm . modulos) [20, 40..])

--Problema 2---------------------------------------------------------------------
primos = 2 : filter ((==1) . length . factores) [3,5..]
factores n = factor n primos
  where
    factor n (p:ps) 
        | p*p > n = [n]
        | mod n p == 0 = p : factor (div n p) (p:ps)
        | otherwise = factor n ps
prob2 = primos !! 10000

--Problema 3---------------------------------------------------------------------
prob3 = maximum [x | y<-[100..999], z<-[y..999], let x = y * z, let s = show x, s == reverse s]

--Problema 4---------------------------------------------------------------------
data Tree a = EmptyTree | Node a (Tree a)(Tree a) deriving (Show, Read, Eq)
insertTree x EmptyTree = Node x (EmptyTree)(EmptyTree)
insertTree x (Node y left right)
           | x == y = Node x left right
           | x < y  = Node y (insertTree x left) right
           | x > y  = Node y left (insertTree x right)
treeList EmptyTree = []
treeList (Node y left right) = (treeList left) ++ [y] ++ (treeList right)
----------------------------------------------------------------------------------

main = do
	print "-Problema 1:"
	print prob1
	print "- Problema 2:"
	print prob2
	print "- Problema 3:"
	print prob3