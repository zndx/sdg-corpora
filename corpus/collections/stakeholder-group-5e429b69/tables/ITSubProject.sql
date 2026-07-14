CREATE TABLE ITSubProject (
  id INTEGER NOT NULL,
  subProjectId INTEGER,
  subProjectName VARCHAR(32),
  budgetAllocation VARCHAR(32),
  implementationPhase INTEGER,
  technologyStack VARCHAR(32),
  successMetric VARCHAR(32),
  initiativeId INTEGER,
  processId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (initiativeId) REFERENCES ReformInitiative (id),
  FOREIGN KEY (processId) REFERENCES ITGovernanceProcess (id)
);
