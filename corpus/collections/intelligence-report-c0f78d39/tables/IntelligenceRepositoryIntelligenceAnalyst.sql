CREATE TABLE IntelligenceRepositoryIntelligenceAnalyst (
  repositoryId INTEGER NOT NULL,
  analystId INTEGER NOT NULL,
  PRIMARY KEY (repositoryId, analystId),
  FOREIGN KEY (repositoryId) REFERENCES IntelligenceRepository (repositoryId),
  FOREIGN KEY (analystId) REFERENCES IntelligenceAnalyst (analystId)
);
