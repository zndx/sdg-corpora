CREATE TABLE IntelligenceRepositoryIntelligenceReport (
  repositoryId INTEGER NOT NULL,
  reportId INTEGER NOT NULL,
  PRIMARY KEY (repositoryId, reportId),
  FOREIGN KEY (repositoryId) REFERENCES IntelligenceRepository (repositoryId),
  FOREIGN KEY (reportId) REFERENCES IntelligenceReport (id)
);
