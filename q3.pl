%Alexander Kuhn
%ID 101023154

%takes 2 arguments, one list and one variable to hold the value of the list's last item
%finds last element in list using append
lastEle(X, L) :-
    append(_, [X], L).
	
%takes a list of number grades and a variable as arguments
%maps the letter grade values of the grades over to the	variable
gradeMap(L,R):- 
	maplist(grade,L,R).

grade(X,a):- between(80,100,X).
grade(X,b):- between(70,79,X).
grade(X,c):- between(60,69,X).
grade(X,d):- between(50,59,X).
grade(X,f):- between(0,49,X).

%takes 4 arguments, one list, one pivot value, two blank lists to fill
%filters the values in the list to one of the two blanks depending on whether they are under or over the pivot value
split([], _, [], []).
split([H|T], Pivot, L1, [H|T2]) :-
	Pivot < H,
    split(T, Pivot, L1, T2).
split([H|T], Pivot, [H|T1], L2) :-
	Pivot >= H,
    split(T, Pivot, T1, L2).

%takes 3 arguments, two values and a list
%checks to see if the values have adjacent indices in the list
myNextto(X, Y, [X,Y|_]).
myNextto(X, Y, [Y,X|_]).
myNextto(X, Y, [_|Tail]) :-
    myNextto(X, Y, Tail).