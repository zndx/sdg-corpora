CREATE TABLE CatalyticFinancingMechanism (
  mechanismId INTEGER NOT NULL,
  mechanismID VARCHAR(32),
  mechanismName VARCHAR(32),
  totalFundingUSD DECIMAL,
  fundingStatus VARCHAR(32),
  targetCountries VARCHAR(32),
  disbursementDate DATE,
  fundsMechanismId INTEGER,
  normID VARCHAR(32),
  facilityID VARCHAR(32),
  PRIMARY KEY (mechanismId),
  FOREIGN KEY (fundsMechanismId) REFERENCES JointAssessmentMechanism (id),
  FOREIGN KEY (normID) REFERENCES BiosecurityNorm (normID),
  FOREIGN KEY (facilityID) REFERENCES ResearchFacility (facilityID)
);
