CREATE TABLE ReformInitiative (
  id INTEGER NOT NULL,
  initiativeId VARCHAR(44),
  initiativeName VARCHAR(32),
  startDate DATE,
  endDate DATE,
  budgetAmount DECIMAL,
  fundingAgency VARCHAR(32),
  completionStatus VARCHAR(32),
  projectId INTEGER,
  createdAt TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (projectId) REFERENCES ITSubProject (id)
);
