CREATE TABLE IntelligenceReport (
  id INTEGER NOT NULL,
  reportIdentifier VARCHAR(32),
  reportDate TIMESTAMP,
  classificationLevel VARCHAR(33),
  threatCategory VARCHAR(35),
  status VARCHAR(32),
  complianceStandard VARCHAR(32),
  repositoryId INTEGER,
  analystId INTEGER,
  interestId INTEGER,
  agencyId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (repositoryId) REFERENCES IntelligenceRepository (repositoryId),
  FOREIGN KEY (analystId) REFERENCES IntelligenceAnalyst (analystId),
  FOREIGN KEY (interestId) REFERENCES SubjectOfInterest (interestId),
  FOREIGN KEY (agencyId) REFERENCES PartnerAgency (agencyId)
);
