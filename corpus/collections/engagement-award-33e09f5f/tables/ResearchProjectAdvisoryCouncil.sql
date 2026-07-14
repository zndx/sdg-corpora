CREATE TABLE ResearchProjectAdvisoryCouncil (
  projectId INTEGER NOT NULL,
  councilId INTEGER NOT NULL,
  PRIMARY KEY (projectId, councilId),
  FOREIGN KEY (projectId) REFERENCES ResearchProject (projectId),
  FOREIGN KEY (councilId) REFERENCES AdvisoryCouncil (id)
);
