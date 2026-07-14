CREATE TABLE DisciplinaryReferral (
  id INTEGER NOT NULL,
  referralId VARCHAR(35),
  referralDate TIMESTAMP,
  referralReason VARCHAR(37),
  forwardedTo VARCHAR(33),
  commissionId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (commissionId) REFERENCES MCLECommission (id)
);
