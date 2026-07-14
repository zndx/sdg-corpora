CREATE TABLE IntelligenceAnalyst (
  analystId INTEGER NOT NULL,
  analystBadgeNumber VARCHAR(32),
  analystName VARCHAR(32),
  agencyAffiliation VARCHAR(38),
  clearanceLevel VARCHAR(33),
  assignmentDate DATE,
  status VARCHAR(32),
  unitId INTEGER,
  repositoryId INTEGER,
  agencyId INTEGER,
  createdAt TIMESTAMP,
  updatedAt TIMESTAMP,
  PRIMARY KEY (analystId),
  FOREIGN KEY (unitId) REFERENCES IntelligenceUnit (id),
  FOREIGN KEY (repositoryId) REFERENCES IntelligenceRepository (repositoryId),
  FOREIGN KEY (agencyId) REFERENCES PartnerAgency (agencyId)
);
