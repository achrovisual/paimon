:- consult("scenarios.pl").

start(TravelerName) :-
  format("Good day, ~w!~n~n", [TravelerName]),

  % Ask if the traveler is a Filipino. If yes, assert the fact into the knowledge base, i.e. the traveler is a Filipino.
  (not(nationality(TravelerName)) -> (write("Are you a Filipino?: "), nl, read(NTR),
  ((NTR = 'Yes' ; NTR = 'yes' ; NTR = 'Y' ; NTR = 'y') -> assert(nationality(TravelerName)) ; true)); true),

  % If the traveler is not a Filipino, terminate as the travel agent can only accommodate Filipinos.
  (not(nationality(TravelerName)) -> write("Sorry, I can only cater to Filipino travelers.") ; true) -> nationality(TravelerName),

  % Ask if the traveler has Swedish citizenship. If yes, assert the fact into the knowledge base, i.e. the traveler is Swedish citizen.
  write("Are you a Swedish citizen?: "), nl, read(DCR),
  ((DCR = 'Yes' ; DCR = 'yes' ; DCR = 'Y' ; DCR = 'y') -> assert(citizenship(TravelerName)) ; true),

  % Ask if the traveler is a resident in Sweden. If yes, assert the fact into the knowledge base, i.e. the traveler resides in Sweden.
  write("Are you a foreign resident in Sweden?: "), nl, read(RDR),
  ((RDR = 'Yes' ; RDR = 'yes' ; RDR = 'Y' ; RDR = 'y') -> assert(residency(TravelerName)) ; true),

  % Ask if the traveler has a valid Schengen visa. If yes, assert the fact into the knowledge base, i.e. the traveler has a valid visa.
  write("Do you have visa issued within the last 90 days?: "), nl, read(VVR),
  ((VVR = 'Yes' ; VVR = 'yes' ; VVR = 'Y' ; VVR = 'y') -> assert(visa(TravelerName)) ; true),

  % Ask if the traveler has a valid vaccine certificate. If yes, assert the fact into the knowledge base, i.e. the traveler has a valid vaccine certificate.
  write("Do you have an EAA-issued vaccine certificate?: "), nl, read(VCR),
  ((VCR = 'Yes' ; VCR = 'yes' ; VCR = 'Y' ; VCR = 'y') -> assert(certificate(TravelerName)) ; true),

  % Ask if the traveler is traveling as a tourist. If yes, assert the fact into the knowledge base, i.e. the traveler is going to Sweden for tourism.
  write("Are you traveling for tourism?: "), nl, read(TRR),
  ((TRR = 'Yes' ; TRR = 'yes' ; TRR = 'Y' ; TRR = 'y') -> assert(tourism(TravelerName)) ; true),

  % Ask if the traveler is studying in Sweden. If yes, assert the fact into the knowledge base, i.e. the traveler is foreign student in Sweden.
  write("Are you a foreign student in Sweden? "), nl, read(STR),
  ((STR = 'Yes' ; STR = 'yes' ; STR = 'Y' ; STR = 'y') -> assert(exemption(TravelerName)) ; true),

  % Ask if the traveler is working in the healthcare or transportation industry in Sweden. If yes, assert the fact into the knowledge base, 
  % i.e. the traveler is working in one of the aforementioned industries.
  write("Are you traveling for work-related reasons such as healthcare and transportation industries? "), nl, read(WKR),
  ((WKR= 'Yes' ; WKR = 'yes' ; WKR = 'Y' ; WKR = 'y') -> assert(exemption(TravelerName)) ; true),

  % Ask if the traveler is invited by a Swedish Government Office. If yes, add to KB.
  write("Are you traveling to Sweden because you are invited by a Swedish Government Office?"), nl, read(INV), 
  ((INV = "Yes"; INV = "yes"; INV = "Y"; INV = 'y') -> assert(exemption(TravelerName)) ; true),

  % Check if traveler is allowed based on their description, i.e. dual citizen, resident, official business (student or work-related). 
  (completeDocuments(TravelerName) -> (
    dualCitizen(TravelerName) ;
    resident(TravelerName) ;
    officialBusiness(TravelerName) ;
    (tourist(TravelerName) -> write("Sorry, you're not allowed to enter.")) -> false
  )).
