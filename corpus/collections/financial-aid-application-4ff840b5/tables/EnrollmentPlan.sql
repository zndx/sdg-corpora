CREATE TABLE EnrollmentPlan (
  planId INTEGER NOT NULL,
  plannedCredits INTEGER,
  isHalfTimeMinimum BOOLEAN,
  isWithdrawing BOOLEAN,
  doesNotNeedAid BOOLEAN,
  termId VARCHAR(32),
  applicationId INTEGER,
  PRIMARY KEY (planId),
  FOREIGN KEY (termId) REFERENCES AcademicTerm (termId),
  FOREIGN KEY (applicationId) REFERENCES FinancialAidApplication (id)
);
