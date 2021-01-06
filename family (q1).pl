%Alexander Kuhn
%ID 101023154

male(derek).
male(alan).
male(william).
male(philip).
male(michael).
female(anna).
female(susan).
female(emma).
female(nicole).
female(jane).
female(rebecca).
father(alan,derek).
father(alan,nicole).
father(alan,philip).
father(derek,susan).
father(william,alan).
father(philip,michael).
mother(anna,alan).
mother(emma,derek).
mother(emma,philip).
mother(emma,nicole).
mother(jane,susan).
mother(rebecca,michael).
married(william,anna).
married(alan,emma).
married(derek,jane).
married(philip,rebecca).

%William and Anna had Alan
%Alan and Emma had Derek and Philip and Nicole
%Derek and Jane had Susan
%Philip and Rebecca had Michael

%takes two arguments, returns true if X is Y's parent, false otherwise
parent(X,Y):-
	(father(X,Y); mother(X,Y)),
	different(X,Y).

%takes two arguments, returns true if X is identical to Y, false otherwise
different(X,Y):-
	X \= Y.

%takes one argument, returns true if X is a mother, false otherwise
is_mother(X):-
	mother(X,_) .

%takes one argument, returns true if X is a father, false otherwise
is_father(X):-
	father(X,_) .

%takes two arguments, returns true if X is Y's biological aunt, false otherwise	
aunt(X,Y):-
	female(X),
	father(P,X),
	father(M,Y),
	father(P,M),
	different(X,Y),
	different(X,M).

%takes two arguments, returns true if X is Y's biological uncle, false otherwise
uncle(X,Y):-
	male(X),
	father(P,X),
	father(M,Y),
	father(P,M),
	different(X,Y),
	different(X,M).

%takes two arguments, returns true if X is Y's sister, false otherwise	
sister(X,Y):-
	female(X),
	father(P,X),
	father(P,Y),
	different(X,Y).

%takes two arguments, returns true if X is Y's brother, false otherwise	
brother(X,Y):-
	male(X),
	father(P,X),
	father(P,Y),
	different(X,Y).

%takes two arguments, returns true if X is Y's grandfather, false otherwise	
grandfather(X,Y):-
	male(X),
	father(X,P),
	(father(P,Y);
	mother(P,Y)),
	different(X,Y).

%takes two arguments, returns true if X is Y's grandmother, false otherwise		
grandmother(X,Y):-
	female(X),
	mother(X,P),
	(father(P,Y);
	mother(P,Y)),
	different(X,Y).

%takes two arguments, returns true if Y is descended from X, false otherwise		
ancestor(X,Y):- 
	parent(X,Y),
	different(X,Y).
ancestor(X,Y):- 
	parent(X,Z),
	ancestor(Z,Y),
	different(X,Y).