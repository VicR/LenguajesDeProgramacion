/* Ej 1*/
list(_, [], X, Y, X, Y).
list(N, [H|T], X, Y, May, Men):- H =:= N, list(N, T, X, Y, May, Men).
list(N, [H|T], X, Y, May, Men):- H < N, append(Y,[H],A), list(N, T, X, A, May, Men).
list(N, [H|T], X, Y, May, Men):- H > N, append(X,[H],A), list(N, T, A, Y, May, Men).
separate(N, Newlst, Z, W):-list(N,Newlst,[],[],Z,W),!.

/* Ej 2*/
