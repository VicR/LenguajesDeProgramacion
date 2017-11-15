myappend(A,B,B,A).
myAppend([1,2,3|X], X, [4,5],Y).

myappend2(A-B,B,C).
myappend2([1,2,3|X] - X, [5,6], Y).

##Guardar datos en base. Programación dinámica
assert(edad(pedro,15)).
assert(joven(pedro)).
assert(joven(X):-edad(X,Y),Y<18).

##Regresa la potencia de la suma de dos numeros
:-dynamic tabla/3.
sumP(X,Y,Z):-tabla(X,Y,Z), !.
sumP(X,Y,Z):- Z is (X+Y) * (X+Y), assertz(tabla(X,Y,Z)).
