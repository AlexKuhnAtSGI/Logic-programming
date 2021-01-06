%Alexander Kuhn
%ID 101023154

%takes 3 arguments, 2 lists to add together and one variable to store their combined values
%recursively strips values out of the first list, turns the variable into the second list, then adds the first list's values to the variable
myAppend([], L2, L2).
myAppend([H|L1], L2, [H|L3]):-
	myAppend(L1, L2, L3).

%takes 2 arguments, a value and a list
%uses append to compare the value and the head of the list	
myFirst(X,L):-
	myAppend([X|_],_,L).

%identical to my previous append
myLast(X,L):-	
	myAppend(_,[X],L).

%had to rename this so it wouldn't conflict with the previous myNextto
%takes 3 arguments, two values and a list
%checks to see if the values have adjacent indices in the list using myAppend
myNexttoAlt(X,Y,L):-
	(myAppend(_,[X,Y|_],L);
	myAppend(_,[Y,X|_],L)).

%takes 2 arguments, a list to reverse and a variable to store the reversed list in
%uses append to recursively fill the variable with the values from the original list in reverse order	
myReverse([],[]).
myReverse([H|L1],L2):-
	myReverse(L1,L),
	myAppend(L,[H],L2).