:- consult("qualifications.pl").

completeDocuments(P) :- (not((visa(P), certificate(P))) -> write("You have incomplete documents.") ; true) -> visa(P), certificate(P).

dualCitizen(P) :- (nationality(P), citizenship(P)) -> write("Welcome to Sweden!"), nl, nl.

tourist(P) :- tourism(P), nationality(P), not(citizenship(P)).

officialBusiness(P) :- (exemption(P), nationality(P), not(citizenship(P))) -> write("Welcome to Sweden!"), nl, nl.

resident(P) :- (nationality(P), not(citizenship(P)), residency(P)) -> write("Welcome to Sweden!"), nl, nl.
