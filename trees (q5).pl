%Alexander Kuhn
%ID 101023154

%list takes one argument, returns true if argument is instance of list, false otherwise
%base case - is true if list is empty
list([]).
%recursively checks tail of list until there is no tail left to check
list([_|T]):-
	list(T).

%treeFlat takes list and tree as argument, returns true if all their elements are the same, false otherwise.
%also capable of transforming tree into list if tree is first argument and list is second
%base case - is true if list is empty	
treeFlat([],[]).
treeFlat([H|T],Z):-
	treeFlat(H,L1),
	treeFlat(T,L2),
	append(L1,L2,Z).	
treeFlat(L,[L]).