CREATE TABLE IntelligenceUnit (
  id INTEGER NOT NULL,
  unitCode INTEGER,
  unitName VARCHAR(32),
  parentOrganization VARCHAR(32),
  missionScope VARCHAR(32),
  establishmentDate DATE,
  repositoryId INTEGER,
  agencyId INTEGER,
  createdAt TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (repositoryId) REFERENCES IntelligenceRepository (repositoryId),
  FOREIGN KEY (agencyId) REFERENCES PartnerAgency (agencyId)
);
