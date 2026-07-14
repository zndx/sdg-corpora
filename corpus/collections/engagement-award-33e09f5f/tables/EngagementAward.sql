CREATE TABLE EngagementAward (
  id INTEGER NOT NULL,
  awardId VARCHAR(44),
  awardAmount DECIMAL,
  awardDate DATE,
  awardStatus VARCHAR(32),
  fundingProgram VARCHAR(32),
  reviewOutcome VARCHAR(32),
  agencyId INTEGER,
  projectId INTEGER,
  panelId INTEGER,
  createdAt TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (agencyId) REFERENCES FundingAgency (agencyId),
  FOREIGN KEY (projectId) REFERENCES ResearchProject (projectId),
  FOREIGN KEY (panelId) REFERENCES ReviewPanel (id)
);
