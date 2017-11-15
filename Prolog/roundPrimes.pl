##Víctor Rendón Suárez | A01022462
##Guardar los circulares primos en una table
:-dynamic tableP/1.
Prime(X, 1):-tableP(X), !.
number_chars(X,list).
Prime([H|T], Ct):- 0 is H mod X , Ct > 4, ! ; Prime([T|H], Ct+1).
