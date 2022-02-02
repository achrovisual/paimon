:- consult("qualifications.pl").

completeDocuments(P) :- (not((visa(P), certificate(P))) -> write("You have incomplete documents.") ; true) -> visa(P), certificate(P).

dualCitizen(P) :- completeDocuments(P), nationality(P), citizenship(P).

tourist(P) :- tourism(P), completeDocuments(P), nationality(P).

officialBusiness(P) :- exemption(P), completeDocuments(P), nationality(P).
