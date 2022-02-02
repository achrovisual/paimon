:- consult("qualifications.pl").

dualCitizen(P) :-
  visa(P), citizenship(P).
