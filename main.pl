:- consult("scenarios.pl").

start(TravelerName) :-
  format("Good day, ~w!~n~n", [TravelerName]),

  (not(nationality(P)) -> (write("Are you a Filipino?: "), nl, read(NTR),
  ((NTR = 'Yes' ; NTR = 'yes' ; NTR = 'Y' ; NTR = 'y') -> assert(nationality(P)) ; true)); true),

  (not(nationality(P)) -> write("Sorry, I can only cater to Filipino travelers.") ; true) -> nationality(P),

  write("Are you a Swedish citizen?: "), nl, read(DCR),
  ((DCR = 'Yes' ; DCR = 'yes' ; DCR = 'Y' ; DCR = 'y') -> assert(citizenship(P)) ; true),

  write("Do you have visa issued within the last 90 days?: "), nl, read(VVR),
  ((VVR = 'Yes' ; VVR = 'yes' ; VVR = 'Y' ; VVR = 'y') -> assert(visa(P)) ; true),

  write("Do you have EAA-issued vaccine certificate?: "), nl, read(VCR),
  ((VCR = 'Yes' ; VCR = 'yes' ; VCR = 'Y' ; VCR = 'y') -> assert(certificate(P)) ; true),

  dualCitizen(P) -> write("Welcome to IKEA!").
