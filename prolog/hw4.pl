% Andrew Davison HW4

% solution(France,Switzerland,Italy,Belgium,Holland,Germany,Austria)
% that solve a map-coloring problem from the text
solution(France,Switzerland,Italy,Belgium,Holland,Germany,Austria) :-
  color(France), color(Switzerland), color(Italy), color(Belgium), color(Holland), color(Germany), color(Austria),
  \+ France=Switzerland, \+ France=Italy, \+ France=Belgium, \+ France=Germany,
  \+ Switzerland=Italy, \+ Switzerland=Germany, \+ Switzerland=Austria,
  \+ Italy=Austria, \+ Belgium=Germany, \+ Belgium=Holland,
  \+ Holland=Germany, \+ Germany=Austria.
% The three colors:
color(red).
color(yellow).
color(orange).

print_colors :- 
  solution(France,Switzerland,Italy,Belgium,Holland,Germany,Austria), nl,
  write('France is colored '), write(France), nl,
  write('Switzerland is colored '), write(Switzerland), nl,
  write('Italy is colored '), write(Italy), nl,
  write('Belgium is colored '), write(Belgium), nl,
  write('Holland is colored '), write(Holland), nl,
  write('Germany is colored '), write(Germany), nl,
  write('Austria is colored '), write(Austria), nl.


% solution(...) holds for a solution to CROSS + ROADS = DANGER
solution(C,R,O,S,A,D,N,G,E) :-
  dig(S), dig(S),
  R is (S+S) mod 10, C1 is (S+S) // 10,
  dig(S), dig(D),
  E is (S+D+C1) mod 10, C10 is (S+D+C1) // 10,
  dig(O), dig(A),
  G is (O+A+C10) mod 10, C100 is (O+A+C10) // 10,
  dig(R), dig(O),
  N is (R+O+C100) mod 10, C1000 is (R+O+C100) // 10,
  dig(C), dig(R),
  A is (C+R+C1000) mod 10, D is (C+R+C1000) // 10,
  uniq_digits(C,R,O,S,A,D,N,G,E).

% uniq(....) holds if the arguments are all distinct digits
uniq_digits(C,R,O,S,A,D,N,G,E) :-
  dig(C), dig(R), dig(O), dig(S), dig(A), dig(D), dig(N), dig(G), dig(E),
  \+ C=R, \+ C=O, \+ C=S, \+ C=A, \+ C=D, \+ C=N, \+ C=G, \+ C=E,
          \+ R=O, \+ R=S, \+ R=A, \+ R=D, \+ R=N, \+ R=G, \+ R=E,
                  \+ O=S, \+ O=A, \+ O=D, \+ O=N, \+ O=G, \+ O=E,
                          \+ S=A, \+ S=D, \+ S=N, \+ S=G, \+ S=E,
                                  \+ A=D, \+ A=N, \+ A=G, \+ A=E,
                                          \+ D=N, \+ D=G, \+ D=E,
                                                  \+ N=G, \+ N=E,
                                                          \+ G=E.

% the digits 
dig(0).
dig(1).
dig(2).
dig(3).
dig(4).
dig(5).
dig(6).
dig(7).
dig(8).
dig(9).

% a solution to the logic puzzle who ordered the pizza
% variables {beside, across, steak, chicken, coke, lasagna, milk, coffee, water}
% domain {donna, danny, david, doreen}
solution(Pizza) :-
  % distinct food and beverages
  uniq_people(Steak,Chicken,Lasagna,Pizza),
  uniq_people(Milk,Coke,Coffee,Water),
  % The given clues
  across(donna,doreen),
  across(david,danny),
  besides(doreen,Steak),
  Chicken=Coke,
  across(Lasagna,Milk),
  \+ david=Coffee,
  donna=Water, \+ danny=Water, \+ david=Water, \+ doreen=Water,
  \+ donna=Steak,
  \+ donna=Coke,
  \+ donna=Chicken,
  \+ danny=Steak,
  besides(donna,danny),
  besides(doreen,david).

% uniq(....) is used to generate 4 distinct people
uniq_people(A,B,C,D) :- person(A), person(B), person(C), person(D),
                                   \+ A=B, \+ A=C, \+ A=D,
                                           \+ B=C, \+ B=D,
                                                   \+ C=D.
% across and besides
across(X,Y) :- \+ X=Y.
besides(X,Y) :- \+ X=Y.

% the four given people
person(david).
person(doreen).
person(danny).
person(donna).
