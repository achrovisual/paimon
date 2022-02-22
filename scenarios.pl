:- consult("qualifications.pl").

completeDocuments(P) :- (visa(P), certificate(P), covidtest(P)).

dualCitizen(P) :- (nationality(P), citizenship(P)).

tourist(P) :- tourism(P), nationality(P), not(citizenship(P)).

officialBusiness(P) :- (exemption(P), nationality(P), not(citizenship(P))).

resident(P) :- (nationality(P), not(citizenship(P)), residency(P)).
