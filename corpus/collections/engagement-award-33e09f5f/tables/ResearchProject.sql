CREATE TABLE ResearchProject (
  projectId INTEGER NOT NULL,
  projectTitle VARCHAR(32),
  startDate TIMESTAMP,
  endDate TIMESTAMP,
  projectStatus VARCHAR(32),
  primaryObjective VARCHAR(32),
  deliverableCount INTEGER,
  awardId INTEGER,
  outputId INTEGER,
  createdAt TIMESTAMP,
  PRIMARY KEY (projectId),
  FOREIGN KEY (awardId) REFERENCES EngagementAward (id),
  FOREIGN KEY (outputId) REFERENCES ResearchOutput (id)
);
