CREATE TABLE SubjectOfInterest (
  interestId INTEGER NOT NULL,
  subjectIdentifier VARCHAR(32),
  subjectName VARCHAR(32),
  subjectType VARCHAR(32),
  riskLevel VARCHAR(32),
  lastKnownLocation VARCHAR(32),
  associatedThreats VARCHAR(32),
  unitId INTEGER,
  reportId INTEGER,
  PRIMARY KEY (interestId),
  FOREIGN KEY (unitId) REFERENCES IntelligenceUnit (id),
  FOREIGN KEY (reportId) REFERENCES SuspiciousActivityReport (id)
);
