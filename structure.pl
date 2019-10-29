%%A struct will be a list of 9 positions, with the numbers 1 to 8 and blank

position(X,[X|L], 0) :- !.
position(X,[_|L],Z) :- position(X,L,Y), Z is Y+1,!.

isCorner(X,L) :- position(X,L,0),!.
isCorner(X,L) :- position(X,L,2),!.
isCorner(X,L) :- position(X,L,6),!.
isCorner(X,L) :- position(X,L,8),!.

isMiddle(X,L) :- position(X,L,1),!.
isMiddle(X,L) :- position(X,L,3),!.
isMiddle(X,L) :- position(X,L,5),!.
isMiddle(X,L) :- position(X,L,7),!.

isCenter(X,L) :- position(X,L,4),!.


neighboard(0,1).
neighboard(0,3).

neighboard(1,2).
neighboard(1,4).

neighboard(2,5).

neighboard(3,4).
neighboard(3,6).

neighboard(4,5).
neighboard(4,7).

neighboard(5,8).

neighboard(6,7).

neighboard(7,8).

neighboard(X,Y) :- X < Y, neighboard(Y,X).

substitute(_,[],_,[]).
substitute(0,[_|L], V, [V|L]).
substitute(I,[X|L], V, [X|K]) :- J is I-1, substitute(J,L,V,K).

swap(I,J,L1, L3) :- position(V1,L1,J),position(V2,L1,I),substitute(I,L1,V1,L2),substitute(J,L2,V2,L3).


%%Now we need to put the next relation

next(L1,L2) :- position(blank,L1,I), neighboard(I,J), swap(I,J,L1,L2).

