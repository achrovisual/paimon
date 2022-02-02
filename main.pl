:- consult("scenarios.pl").

start(TravelerName) :-
  format("Good day, ~w!~n~n", [TravelerName]),
  (not(citizenship(P)) -> (write("Are you a Swedish citizen?: "), nl, read(DCR),
  ((DCR = 'Yes' ; DCR = 'yes' ; DCR = 'Y' ; DCR = 'y') -> assert(citizenship(P)) ; true)); true),

  write("Do you have visa issued within the last 90 days?: "), nl, read(VVR),
  ((VVR = 'Yes' ; VVR = 'yes' ; VVR = 'Y' ; VVR = 'y') -> assert(visa(P)) ; true),

  dualCitizen(P) -> write("Welcome to IKEA!").
