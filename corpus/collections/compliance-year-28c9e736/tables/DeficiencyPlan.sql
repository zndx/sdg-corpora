CREATE TABLE DeficiencyPlan (
  planId INTEGER NOT NULL,
  submissionDate TIMESTAMP,
  completionDeadline DATE,
  planStatus VARCHAR(32),
  goodCauseJustification VARCHAR(32),
  yearId INTEGER,
  attorneyId INTEGER,
  feeId INTEGER,
  PRIMARY KEY (planId),
  FOREIGN KEY (yearId) REFERENCES ComplianceYear (yearId),
  FOREIGN KEY (attorneyId) REFERENCES Attorney (id),
  FOREIGN KEY (feeId) REFERENCES LateFee (feeId)
);
