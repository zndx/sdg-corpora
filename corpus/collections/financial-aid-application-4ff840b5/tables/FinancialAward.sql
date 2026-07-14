CREATE TABLE FinancialAward (
  id INTEGER NOT NULL,
  awardId VARCHAR(44),
  awardType VARCHAR(32),
  estimatedAmount DECIMAL,
  isWithinAnnualLimit BOOLEAN,
  isWithinAggregateLimit BOOLEAN,
  disbursementStatus VARCHAR(32),
  studentId INTEGER,
  applicationId INTEGER,
  resourceId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (studentId) REFERENCES Student (id),
  FOREIGN KEY (applicationId) REFERENCES FinancialAidApplication (id),
  FOREIGN KEY (resourceId) REFERENCES OtherFinancialResource (resourceId)
);
