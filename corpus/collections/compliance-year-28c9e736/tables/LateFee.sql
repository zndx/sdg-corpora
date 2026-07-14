CREATE TABLE LateFee (
  feeId INTEGER NOT NULL,
  feeAmount DECIMAL,
  feeType VARCHAR(32),
  impositionDate TIMESTAMP,
  paymentStatus VARCHAR(32),
  attorneyId INTEGER,
  reportId INTEGER,
  planId INTEGER,
  PRIMARY KEY (feeId),
  FOREIGN KEY (attorneyId) REFERENCES Attorney (id),
  FOREIGN KEY (reportId) REFERENCES ComplianceReport (id),
  FOREIGN KEY (planId) REFERENCES DeficiencyPlan (planId)
);
