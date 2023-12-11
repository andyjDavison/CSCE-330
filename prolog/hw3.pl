% This is the family relations exercise at the end of Ch.4 [L].
child(alberto,guido). child(alberto,antonietta).
child(giulia,enrico). child(giulia,annamaria).
child(dante,marco).   child(clara,marco).
child(dante,laura).   child(clara,laura).
child(marco,alberto).   child(marco,giulia).
child(laura,lawrence).  child(laura,julie).
child(emily,lawrence).  child(emily, julie).
child(claire,lawrence). child(claire, julie).
child(sam,emily). child(ben,emily).
child(sam,dave). child(ben,dave).
child(eve,claire). child(annabelle,claire).
child(eve,ed). child(annabelle,ed).
child(giulio,guido). child(donata,giulio).
child(sara,donata). child(marco2,donata).
child(giulio,antonietta). child(gioia,clara).

male(guido). male(enrico).
male(marco). male(dante). male(alberto). male(lawrence).
male(sam). male(ben). male(dave). male(ed).
male(giulio). male(marco2).
female(antonietta). female(annamaria).
female(clara).  female(laura).  female(giulia). female(julie).
female(emily). female(claire). female(eve). female(annabelle).
female(donata). female(sara). female(gioia).

%Clauses from Figure 3.1, as required by Exercise of Ch.4[L]
parent(Y,X) :- child(X,Y).
father(Y,X) :- child(X,Y), male(Y).
opp_sex(X,Y) :- male(X), female(Y).
opp_sex(Y,X) :- male(X), female(Y).
grand_father(X,Z) :- father(X,Y), parent(Y,Z).

% New clauses for Exercise of Ch.4[L] follow
mother(Y,X) :- child(X,Y), female(Y).
grand_parent(X,Z) :- parent(X,Y), parent(Y,Z).
great_grand_mother(X,W) :- grand_parent(X,Z), parent(Z,W), female(X).

/*x is a sibling of y if x and y are different and they share at least one parent*/
sibling(X,Y) :- parent(Z,X), parent(Z,Y), X \= Y.
/*a sibling who is male*/
brother(X,Y) :- sibling(X,Y), male(X).
/*a sibling who is female*/
sister(X,Y) :- sibling(X,Y), female(X).

/*siblings who have exactly one parent in common*/
half_sibling(X,Y) :- sibling(X,Y), parent(Z,X), \+ parent(Z,Y), parent(W,Y), parent(W,X).



