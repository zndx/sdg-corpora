CREATE TABLE ResearchOutput (
  id INTEGER NOT NULL,
  outputId VARCHAR(44),
  outputType VARCHAR(32),
  creationDate DATE,
  versionNumber VARCHAR(32),
  status VARCHAR(32),
  accessLevel VARCHAR(32),
  projectId INTEGER,
  councilId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (projectId) REFERENCES ResearchProject (projectId),
  FOREIGN KEY (councilId) REFERENCES AdvisoryCouncil (id)
);
