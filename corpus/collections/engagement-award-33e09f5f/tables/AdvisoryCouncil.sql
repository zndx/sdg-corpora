CREATE TABLE AdvisoryCouncil (
  id INTEGER NOT NULL,
  councilId VARCHAR(44),
  councilName VARCHAR(32),
  organizationId VARCHAR(40),
  establishmentDate DATE,
  councilStatus VARCHAR(32),
  memberCount INTEGER,
  meetingFrequency VARCHAR(32),
  projectId INTEGER,
  advisesOrganizationId INTEGER,
  outputId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (projectId) REFERENCES ResearchProject (projectId),
  FOREIGN KEY (advisesOrganizationId) REFERENCES HealthcareOrganization (id),
  FOREIGN KEY (outputId) REFERENCES ResearchOutput (id)
);
