CREATE TABLE AcademicTerm (
  termId VARCHAR(32) NOT NULL,
  termName VARCHAR(32),
  startDate DATE,
  endDate DATE,
  numberOfWeeks INTEGER,
  isEnrollmentRequired BOOLEAN,
  planId INTEGER,
  awardId INTEGER,
  PRIMARY KEY (termId),
  FOREIGN KEY (planId) REFERENCES EnrollmentPlan (planId),
  FOREIGN KEY (awardId) REFERENCES FinancialAward (id)
);
