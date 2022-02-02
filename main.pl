:- consult("scenarios.pl").

start(TravelerName) :-
  format("Good day, ~w!~n~n", [TravelerName]),

  (not(nationality(TravelerName)) -> (write("Are you a Filipino?: "), nl, read(NTR),
  ((NTR = 'Yes' ; NTR = 'yes' ; NTR = 'Y' ; NTR = 'y') -> assert(nationality(TravelerName)) ; true)); true),

  (not(nationality(TravelerName)) -> write("Sorry, I can only cater to Filipino travelers.") ; true) -> nationality(TravelerName),

  write("Are you a Swedish citizen?: "), nl, read(DCR),
  ((DCR = 'Yes' ; DCR = 'yes' ; DCR = 'Y' ; DCR = 'y') -> assert(citizenship(TravelerName)) ; true),

  write("Do you have visa issued within the last 90 days?: "), nl, read(VVR),
  ((VVR = 'Yes' ; VVR = 'yes' ; VVR = 'Y' ; VVR = 'y') -> assert(visa(TravelerName)) ; true),

  write("Do you have an EAA-issued vaccine certificate?: "), nl, read(VCR),
  ((VCR = 'Yes' ; VCR = 'yes' ; VCR = 'Y' ; VCR = 'y') -> assert(certificate(TravelerName)) ; true),

  write("Are you traveling for tourism?: "), nl, read(TRR),
  ((TRR = 'Yes' ; TRR = 'yes' ; TRR = 'Y' ; TRR = 'y') -> assert(tourism(TravelerName)) ; true),

  write("Are you a foreign student in Sweden? "), nl, read(STR),
  ((STR = 'Yes' ; STR = 'yes' ; STR = 'Y' ; STR = 'y') -> assert(exemption(TravelerName)) ; true),

  officialBusiness(TravelerName),

  write("Welcome to IKEA!").
