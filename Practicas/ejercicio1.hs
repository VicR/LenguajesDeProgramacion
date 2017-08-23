-- Víctor Rendón S. | A01022462
--1) 
[(x, y , z) | x <-[1 .. 100], y <-[1 .. 100], z <-[1 .. 100], z^2 == x^2 + y^2]

--2)
length ([x | x <-[-1000 .. 1000], x < 0])

--3)
sum ([x | x <-[1 .. 100000], mod x 2 == 1])

--4)
map toUpper [x | x <- ("victor")]

--5)
	maxlist [] = error "e"
	maxlist [e] = e
	maxlist(h:t) = max h (maxlist t)

--6)
	factorial 0 = 1
	factorial x = x * (factorial (x - 1))
--7)
	last [] = error "e"