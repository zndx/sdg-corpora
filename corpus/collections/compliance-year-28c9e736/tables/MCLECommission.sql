CREATE TABLE MCLECommission (
  id INTEGER NOT NULL,
  commissionId VARCHAR(44),
  commissionName VARCHAR(32),
  executiveDirectorName VARCHAR(32),
  referralId INTEGER,
  planId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (referralId) REFERENCES DisciplinaryReferral (id),
  FOREIGN KEY (planId) REFERENCES DeficiencyPlan (planId)
);
