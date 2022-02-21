:- consult("scenarios.pl").

start:-
  write("Welcome to the Travel Adviser Agent program!"), nl,
  write("How many are you in the party? (max of 4): "), read(Count),
  (Count<1 -> write("It seems no one is planning to travel. See you next time!") ; true) -> Count>=1,
  (Count>4 -> write("Sorry, I can only cater up to 4 passengers in a party.") ; true) -> Count=<4,
  loop(0, Count),
  write("Thank you for using the Travel Adviser Agent program. See you next time!").

loop(Stop, Stop).
loop(Start, Stop) :-
  Start<Stop,

  write("Please enter your name: "), nl, read(TravelerName), nl, nl,
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

  /* Ask if the traveler is working in the healthcare or transportation industry in Sweden. If yes, assert the fact into the knowledge base, 
     i.e. the traveler is working in one of the aforementioned industries. */
  write("Are you traveling for work-related reasons such as healthcare and transportation industries?: "), nl, read(WKR),
  ((WKR= 'Yes' ; WKR = 'yes' ; WKR = 'Y' ; WKR = 'y') -> assert(exemption(TravelerName)) ; true),

  /* Ask if the traveler is invited by a Swedish Government Office. If yes, add to KB.*/
  write("Are you traveling to Sweden because you are invited by a Swedish Government Office?"), nl, read(EXI), 
  ((EXI = 'Yes' ; EXI = 'yes' ; EXI = 'Y' ; EXI = 'y') -> assert(exemption(TravelerName)) ; true),
 
  /* Ask if the traveler works in an international organization/invited by such an organization, where their presence is necessary for their activity,
     where it is within the cope of international defense cooperation, aid workers, and civil defense staff. If yes, store in KB. */
  write("Are you traveling to Sweden because you are invited by an organization whose activities are within the scope of international defense cooperation, aid workers, and civil defense staff?: "), nl, read(EXO), 
  ((EXO = 'Yes' ; EXO = 'yes' ; EXO = 'Y' ; EXO = 'y') -> assert(exemption(TravelerName)) ; true),
  
  /* Ask if the traveler is entering Sweden in order to perform highly-skilled work, when it must be done immediately and cannot be done remotely.
     Also, participation in an international elite sports competition is included in this scope. If yes, store into KB. */
  write("Are you traveling to Sweden because you are to perform highly-skilled work (participation in international elite sports competitions belong in this category)?: "), nl, read(EXH), 
  ((EXH = 'Yes' ; EXH = 'yes' ; EXH = 'Y'; EXH = 'y') -> assert(exemption(TravelerName)) ; true),


  % Check if traveler is allowed based on their description, i.e. dual citizen, resident, official business (student or work-related). 
  (completeDocuments(TravelerName) -> (
    dualCitizen(TravelerName) ;
    resident(TravelerName) ;
    officialBusiness(TravelerName) ;
    (tourist(TravelerName) -> write("Sorry, you're not allowed to enter.")) -> false
  )),

  Step is Start+1, loop(Step, Stop).
