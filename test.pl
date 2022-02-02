start :-
  write('Hello!'),
  nl,
  hypothesis(Qualification),
  write(Qualification).
  undo.

hypothesis(filipino_swedish) :- filipino_swedish, !.


filipino_swedish:-
  requirements(filipino),
  requirements(swedish_citizen),
  requirements(covid_certificate).

ask(Question) :-
  write('Are you '),
  write(Question),
  write('? '),
  nl,
  ( (Response == yes ; Response == y)
  ->
  assert(yes(Question)) ;
  assert(no(Question)), fail).

requirements(R) :-
  (yes(R)
  ->
  true ;
  (no(R)
  ->
  fail ;
  ask(R))).

undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.
