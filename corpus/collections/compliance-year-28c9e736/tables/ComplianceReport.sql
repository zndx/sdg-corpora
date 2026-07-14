CREATE TABLE ComplianceReport (
  id INTEGER NOT NULL,
  reportId VARCHAR(32),
  submissionDate TIMESTAMP,
  creditsEarned DECIMAL,
  professionalismCourseCompleted BOOLEAN,
  reportStatus VARCHAR(32),
  yearId INTEGER,
  attorneyId INTEGER,
  feeId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (yearId) REFERENCES ComplianceYear (yearId),
  FOREIGN KEY (attorneyId) REFERENCES Attorney (id),
  FOREIGN KEY (feeId) REFERENCES LateFee (feeId)
);
