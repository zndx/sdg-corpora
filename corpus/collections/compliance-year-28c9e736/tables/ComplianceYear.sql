CREATE TABLE ComplianceYear (
  yearId INTEGER NOT NULL,
  yearStart DATE,
  yearEnd DATE,
  creditRequirement INTEGER,
  planId INTEGER,
  PRIMARY KEY (yearId),
  FOREIGN KEY (planId) REFERENCES DeficiencyPlan (planId)
);
