CREATE TABLE DisciplinaryReferralAttorney (
  referralId INTEGER NOT NULL,
  attorneyId INTEGER NOT NULL,
  PRIMARY KEY (referralId, attorneyId),
  FOREIGN KEY (referralId) REFERENCES DisciplinaryReferral (id),
  FOREIGN KEY (attorneyId) REFERENCES Attorney (id)
);
