CREATE TABLE Attorney (
  id INTEGER NOT NULL,
  barLicenseNumber VARCHAR(32),
  fullName VARCHAR(36),
  barStatus VARCHAR(32),
  planId INTEGER,
  feeId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (planId) REFERENCES DeficiencyPlan (planId),
  FOREIGN KEY (feeId) REFERENCES LateFee (feeId)
);
