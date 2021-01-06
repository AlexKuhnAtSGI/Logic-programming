%Alexander Kuhn
%ID 101023154

actor(jonny, depp, gender(male)).
actor(bruce, willis, gender(male)).
actor(glenn, close, gender(female)).
actor(orlando, bloom, gender(male)).
actor(jennifer, lawrence, gender(female)).
actor(sean, bean, gender(male)).
actor(angelina, jolie, gender(female)).
actor(keira, knightley, gender(female)).
actor(benedict, cumberbatch, gender(male)).
actor(james,mcavoy, gender(male)).
actor(robin, williams, gender(male)).
actor(emilia, clarke, gender(female)).
actor(ryan, reynolds, gender(male)).
actor(chris, pratt, gender(male)).
actor(ryan, gosling, gender(male)).
actor(robin,wright, gender(female)).
actor(karen, gillan, gender(female)).
actor(kirsten, dunst, gender(female)).
actor(dwayne, johnson, gender(male)).
actor(jack, black, gender(male)).
actor(tobey, maguire, gender(male)).
actor(keanu, reeves, gender(male)).

movie(year(2003), title([pirates,of,the,carribean]), cast([actor(jonny, depp), actor(keira, knightley), actor(orlando, bloom)])).
movie(year(2014), title([guardians, of, the, galaxy]), cast([actor(chris, pratt), actor(karen,gillan) ])).
movie(year(1988), title([die,hard]), cast([actor(bruce, willis)])).
movie(year(2001), title([lord,of,the,rings]), cast([actor(orlando, bloom), actor(sean, bean)])).
movie(year(2016), title([xmen, apocalypse]), cast([actor(jennifer,lawrence), actor(james, mcavoy)])).
movie(year(2014), title([the,imitation,game]), cast([actor(benedict, cumberbatch), actor(keira, knightley)])).
movie(year(2012), title([the,hunger,games]), cast([actor(jennifer,lawrence)])).
movie(year(2016), title([deadpool]), cast([actor(ryan, reynolds)])).
movie(year(1995), title([jumanji]), cast([actor(robin, williams), actor(kirsten, dunst)])).
movie(year(2017), title([jumanji,welcome,to,the,jungle]), cast([actor(dwayne,johnson),actor(karen,gillan),actor(jack,black)])).
movie(year(2003), title([spider,man]), cast([actor(tobey, maguire), actor(kirsten,dunst)])).
movie(year(2017), title([blade,runner,2049]), cast([actor(ryan,gosling), actor(robin,wright)])).



%a) What movies were released before 2012?
	%?-movie(year(Year),Name,_), Year < 2012.
	
	%Year = 2003,
	%Name = title([pirates, of, the, carribean]) ;
	%Year = 1988,
	%Name = title([die, hard]) ;
	%Year = 2001,
	%Name = title([lord, of, the, rings]) ;
	%Year = 1995,
	%Name = title([jumanji]) ;
	%Year = 2003,
	%Name = title([spider, man]) ;
	%false.
	
%b) What are the names of the female actors?
	%?-actor(Name,Surname,gender(female)).
	
	%Name = glenn,
	%Surname = close ;
	%Name = jennifer,
	%Surname = lawrence ;
	%Name = angelina,
	%Surname = jolie ;
	%Name = keira,
	%Surname = knightley ;
	%Name = emilia,
	%Surname = clarke ;
	%Name = robin,
	%Surname = wright ;
	%Name = karen,
	%Surname = gillan ;
	%Name = kirsten,
	%Surname = dunst ;
	%false.
	
%c) in what movies is jennifer lawrence a member of the cast
	%?-movie(_,Name,cast(Cast)), member(actor(jennifer,lawrence),Cast).
	
	%Name = title([xmen, apocalypse]),
	%Cast = [actor(jennifer, lawrence), actor(james, mcavoy)] ;
	%Name = title([the, hunger, games]),
	%Cast = [actor(jennifer, lawrence)] ;
	%false.

%d) What movies contain both the words "of" and "the" in the title (in no particular order)
	%?-movie(_,title(Name),_), member(the,Name),member(of,Name).
	
	%Name = [pirates, of, the, carribean] ;
	%Name = [guardians, of, the, galaxy] ;
	%Name = [lord, of, the, rings] ;
	%false.

%e) What movies star an actor with the first name "Robin"?
	%?-movie(_,Name,cast(Cast)), member(actor(robin,_),Cast).
	
	%Name = title([jumanji]),
	%Cast = [actor(robin, williams), actor(kirsten, dunst)] ;
	%Name = title([blade, runner, 2049]),
	%Cast = [actor(ryan, gosling), actor(robin, wright)].
	
%f) What movies share one or more common actor?
	%?-movie(_,Movie1,cast(Cast1)),movie(_,Movie2,cast(Cast2)), member(SharedActor,Cast1),member(SharedActor,Cast2), Cast1 \= Cast2.
	
	%Movie1 = title([pirates, of, the, carribean]),
	%Cast1 = [actor(jonny, depp), actor(keira, knightley), actor(orlando, bloom)],
	%Movie2 = title([lord, of, the, rings]),
	%Cast2 = [actor(orlando, bloom), actor(sean, bean)],
	%SharedActor = actor(orlando, bloom) ;
	%Movie1 = title([pirates, of, the, carribean]),
	%Cast1 = [actor(jonny, depp), actor(keira, knightley), actor(orlando, bloom)],
	%Movie2 = title([the, imitation, game]),
	%Cast2 = [actor(benedict, cumberbatch), actor(keira, knightley)],
	%SharedActor = actor(keira, knightley) ;
	%Movie1 = title([guardians, of, the, galaxy]),
	%Cast1 = [actor(chris, pratt), actor(karen, gillan)],
	%Movie2 = title([jumanji, welcome, to, the, jungle]),
	%Cast2 = [actor(dwayne, johnson), actor(karen, gillan), actor(jack, black)],
	%SharedActor = actor(karen, gillan) ;
	%Movie1 = title([lord, of, the, rings]),
	%Cast1 = [actor(orlando, bloom), actor(sean, bean)],
	%Movie2 = title([pirates, of, the, carribean]),
	%Cast2 = [actor(jonny, depp), actor(keira, knightley), actor(orlando, bloom)],
	%SharedActor = actor(orlando, bloom) ;
	%Movie1 = title([xmen, apocalypse]),
	%Cast1 = [actor(jennifer, lawrence), actor(james, mcavoy)],
	%Movie2 = title([the, hunger, games]),
	%Cast2 = [actor(jennifer, lawrence)],
	%SharedActor = actor(jennifer, lawrence) ;
	%Movie1 = title([the, imitation, game]),
	%Cast1 = [actor(benedict, cumberbatch), actor(keira, knightley)],
	%Movie2 = title([pirates, of, the, carribean]),
	%Cast2 = [actor(jonny, depp), actor(keira, knightley), actor(orlando, bloom)],
	%SharedActor = actor(keira, knightley) ;
	%Movie1 = title([the, hunger, games]),
	%Cast1 = [actor(jennifer, lawrence)],
	%Movie2 = title([xmen, apocalypse]),
	%Cast2 = [actor(jennifer, lawrence), actor(james, mcavoy)],
	%SharedActor = actor(jennifer, lawrence) ;
	%Movie1 = title([jumanji]),
	%Cast1 = [actor(robin, williams), actor(kirsten, dunst)],
	%Movie2 = title([spider, man]),
	%Cast2 = [actor(tobey, maguire), actor(kirsten, dunst)],
	%SharedActor = actor(kirsten, dunst) ;
	%Movie1 = title([jumanji, welcome, to, the, jungle]),
	%Cast1 = [actor(dwayne, johnson), actor(karen, gillan), actor(jack, black)],
	%Movie2 = title([guardians, of, the, galaxy]),
	%Cast2 = [actor(chris, pratt), actor(karen, gillan)],
	%SharedActor = actor(karen, gillan) ;
	%Movie1 = title([spider, man]),
	%Cast1 = [actor(tobey, maguire), actor(kirsten, dunst)],
	%Movie2 = title([jumanji]),
	%Cast2 = [actor(robin, williams), actor(kirsten, dunst)],
	%SharedActor = actor(kirsten, dunst) ;
	%false.

%g) Who has worked with Orlando Bloom in a movie?
	%?-movie(_,Movie,cast(Cast)),member(Actor,Cast),member(actor(orlando,bloom),Cast), Actor \= actor(orlando,bloom).
	
	%Movie = title([pirates, of, the, carribean]),
	%Cast = [actor(jonny, depp), actor(keira, knightley), actor(orlando, bloom)],
	%Actor = actor(jonny, depp) ;
	%Movie = title([pirates, of, the, carribean]),
	%Cast = [actor(jonny, depp), actor(keira, knightley), actor(orlando, bloom)],
	%Actor = actor(keira, knightley) ;
	%Movie = title([lord, of, the, rings]),
	%Cast = [actor(orlando, bloom), actor(sean, bean)],
	%Actor = actor(sean, bean) ;
	%false.
	
%h) What is the title of the oldest movie?
	%?-movie(year(Year),Name,_), \+ (movie(year(Year2),Name2,_), Name2 \= Name, Year2 < Year).
	
	%Year = 1988,
	%Name = title([die, hard]) ;
	%false.
	
%i) What actors are not in the cast of any movie?
	%?-actor(Name,Surname,_), not((movie(_,_,cast(Cast)), member(actor(Name,Surname), Cast))).
	%Name = glenn,
	%Surname = close ;
	%Name = angelina,
	%Surname = jolie ;
	%Name = emilia,
	%Surname = clarke ;
	%Name = keanu,
	%Surname = reeves.