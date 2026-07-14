CREATE TABLE OtherFinancialResource (
  resourceId INTEGER NOT NULL,
  sourceType VARCHAR(33),
  amount DECIMAL,
  isVerified BOOLEAN,
  studentId INTEGER,
  awardId INTEGER,
  PRIMARY KEY (resourceId),
  FOREIGN KEY (studentId) REFERENCES Student (id),
  FOREIGN KEY (awardId) REFERENCES FinancialAward (id)
);
