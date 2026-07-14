CREATE TABLE SubjectOfInterestIntelligenceReport (
  interestId INTEGER NOT NULL,
  reportId INTEGER NOT NULL,
  PRIMARY KEY (interestId, reportId),
  FOREIGN KEY (interestId) REFERENCES SubjectOfInterest (interestId),
  FOREIGN KEY (reportId) REFERENCES IntelligenceReport (id)
);
