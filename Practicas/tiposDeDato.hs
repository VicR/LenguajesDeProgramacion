-- Víctor Rendón S. | A01022462
data Point = Point Float Float deriving (Show)
data Shape = Circle Float | RectP Point Point | Rectangle Float Float Float Float | Triangle Float Float deriving (Show)

area (Circle r) = pi * r * r
area (RectP (Point x1 y1) (Point x2 y2)) = (x2 - x1) * (y2 - y1)
area (Rectangle x1 y1 x2 y2) = (x2 - x1) * (y2 - y1)
area (Triangle base height) = (base * height) / 2

data Date = Date Int String Int deriving (Show)
getDay (Date d _ _) = d
getMonth (Date _ m _) = m
getYear (Date _ _ y) = y

data Fecha = Fecha {day::Int, month::String, year::Int} deriving (Show, Read)

data Pair key value = Pair key value deriving (Show)


--Practica 2--
data Tree x = Empty | Node x (Tree x) (Tree x) deriving (Show)

insertNode n Empty = Node n Empty Empty
insertNode n (Node x left right)
	| n > x = Node x left (insertNode n right)
	| x > n = Node x (insertNode n left) right
	| otherwise = Node x left right

createTreeFromList lista = func lista Empty
	where func lista x
		| lista == [] = x
		| otherwise = func (tail lista) (insertNode (head lista) x)

addListToTree lista tree
	| lista == [] = tree
	| otherwise = addListToTree (tail lista) (insertNode (head lista) tree)