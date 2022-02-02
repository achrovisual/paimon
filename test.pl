:- dynamic yes/1,no/1.

consult(TravelerName) :-
  write("Are you Filipino?: "), read(Nationality),
  (Nationality = 'Y' ; Nationality = 'y'),
  write("Are you Swedish?: "), read(Citizenship),
  (Citizenship = 'Y' ; Citizenship = 'y'),
  write("Do you have EAA-issued vaccine certifcate?: "), read(Certification),
  (Certification = 'Y' ; Certification = 'y'),

getResult() :-
