/* Víctor Rendón Suárez | A01022462*/

/* Ej 1 [Yo]*/

accSum([],_, Current, Current).
accSum([H|T], Sum, Current, Res):- Z is H + Sum, append(Current,[Z],Y), accSum(T,Z,Y,Res).
ejercicio1(List, X):- accSum(List, 0, [], X).

/* Ej 2 */

listh(_, 0, []).
listh([H|T], N, [H|Sub]) :- N1 is N-1, listh(T, N1, Sub).

listt(T, 0, T).
listt([_|T], N, R) :- N1 is N-1, listt(T, N1, R).

merge(A, [], A).
merge([], B, B).
merge([Ha|Ta], [Hb|Tb], [Ha|Sub]) :- Ha < Hb, merge(Ta, [Hb|Tb], Sub).

merge([Ha|Ta], [Hb|Tb], [Hb|Sub]) :- Ha >= Hb, merge([Ha|Ta], Tb, Sub).

mergesort([H], [H]).
mergesort(List, Sorted) :-
			length(List, Number),
			listh(List, Half, H),
			listt(List, Half, T),
			mergesort(H, A),
			mergesort(T, B),
			merge(A, B, Sorted).

test(Sorted) :- mergesort([10, 9, 8, 4, 5, 6, 7, 3, 2, 1], Sorted).

/* Ej 3 */

insSort(List, [], List).
insSort(List, [H|T], R):-
    insert(List, H, B),
    insSort(B, T, R).
insert(List, Num, A):- separa(Num, List, L, R), append(L,[Num],B), append(B,R,A).
separa(N, [H|T], [H|L], R):-
    H =< N,
    separa(N, T, L, R).
separa(N, [H|T], L, [H|R]):-
    H > N,
    separa(N, T, L, R).
separa(N, [], [], []).

/* Ej 4 */

subset(_,[]).
subset([X|Y],[X|XS]) :- subset(Y,Z).
subset([_|Y],[X|Z]) :- subset(Y,[X|Z]).

/* Ej 5 */

enteroDivisible(Result) :- enteroDivisible(1, 1, Result).
enteroDivisible(Start, 21, Result):-
      Result = Start, !.

enteroDivisible(Start, Div, Result):- X is Start mod Div,
    ( X == 0 ->
      D is Div + 1,
      enteroDivisible(Start, D, Result);
      S is Start + 1,
      enteroDivisible(S, 1, Result)
     ).

/* Ej 7 */

isPalindrome(Num):- number_chars(Num, X), reverse(X, Res), X == Res.

mult(Counter, X, Max, Res):- Counter =:= 999, Res is Max.
mult(Counter, X, Max, Res):- MultRes is (Counter * X), Z is (Counter + 1), isPalindrome(MultRes), (MultRes > Max -> MaxRes is MultRes; MaxRes is Max), mult(Z, X, MaxRes, Res).
mult(Counter, X, Max, Res):- Z is (Counter + 1), mult(Z, X, Max, Res).

palindrome(Num1, Max, ResPal):- Num1 =:= 999, ResPal is Max.
palindrome(Num1, Max, ResPal):- Z is (Num1 + 1), mult(100, Num1, Max, Res), (Res > Max -> MaxRes is Res; MaxRes is Max), palindrome(Z, MaxRes, ResPal).

/* Ej 8 */

t(_,nil,nil).
t(,,nil).
t(,nil,).
t(,,_).

mayorNum([], V, V).
mayorNum([H|T], V, R) :- H>V -> mayorNum(T, H, R) ; mayorNum(T, V, R).
mayorN([H|T], M) :- mayorNum(T, H, M).

menorNum([], V, V).
menorNum([H|T], V, R) :- H<V -> menorNum(T, H, R) ; menorNum(T, V, R).
menorN([H|T], M) :- menorNum(T, H, M).

nodes(nil,[]).
nodes(t(_,nil,nil),[]) :- !.
nodes(t(X,L,R),[X|S]) :- nodes(L,SL), nodes(R,SR), append(SL,SR,S).

mayorNode(T,Ma) :- nodes(T,S), mayorN(S,Ma).

menorNode(T,Me) :- nodes(T,S), menorN(S,Me).

copyTree(T,T).
t(_,nil,nil).
t(_,_,nil).
t(_,nil,_).
t(_,_,_).

inTree(V, t(N,L,R) ):- V<N -> inTree(V,L) ;
					   V>N -> inTree(V,R) ; !.

insertTT(_,nil,F,F).
insertTT(V,t(N,L,R),Res,F) :- V<N->insertTT(V,L,t(N,Res,R),F);
								   insertTT(V,R,t(N,L,Res),F).
insertToTree(V,T,Res) :- inTree(V,T)->copyTree(T,Res)
									 ;insertTT(V,T,t(V,nil,nil),Res).
