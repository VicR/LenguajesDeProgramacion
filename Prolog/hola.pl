famoso(pedro).
famoso(juan).
hombre(juan).
hombre(simon).
hombre(pedro).
hombre(roberto).

padre(pedro, juan).
padre(roberto, pedro).
padre(simon, roberto).

ancestro(X, Y):- padre(Y, X).

feliz(X):-hombre(X),famoso(X).

elementosLista([], Cont, Cont).
elementosLista([_|T], Cont, X):- Z is Cont+1, elementosLista(T, Z, X).
cuenta(Lista, X):- elementosLista(Lista, 0, X).

sameList([], []).
sameList([H|T], [H1|T1]):- H=:=H1, sameList(T, T1).
