% exactly_3(x) is true if x has exactly 3 elements
exactly_3([_,_,_]).

% at_least_3(x) is true if x has at least 3 elements
at_least_3([_,_,_|_]).
at_least_3([H|T]) :- exactly_3(H), at_least_3(T).

% at_most_3(x) is true if x has at most 3 elements
at_most_3([]).
at_most_3(X) :- exactly_3(X).
at_most_3([_,_,_,_|_]) :- !, fail.
at_most_3([_|T]) :- at_most_3(T).

% intersect(x,y) is true if x and y are lists with an element in common
intersect(X,Y) :- member(Z,X), member(Z,Y).

% all_intersect(Z,Y) is true if every element of list Z is a
% list such that intersect(X,Y holds)
all_intersect([],_).
all_intersect([H|T], Y) :- intersect(H,Y), all_intersect(T,Y).
