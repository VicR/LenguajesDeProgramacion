-- Víctor Rendón S. | A01022462

-- Tail recursion
-- - Clausula where
-- - Guard conditions
-- - Otherwise "Si nada se puede evaluar como verdadero"

factorialTail x = ft (x-1) x
	where ft n res
		|n == 0 = res
		|otherwise = ft (n-1) (res*n)

reversaTail r = rev r []
	where rev (x : xs) b
		|xs == [] = b
		|otherwise = rev (xs) (b++[x])

maxmin x = mm (tail x) (head x) (head x)
	where mm x maxx minn
		|x == [] = (max,min)
		|(head x) > maxx = mm(tail x) (head x) minn
		|(head x) < minn = mm(tail x) maxx (head x)
		|otherwise = mn (tail x) max minn