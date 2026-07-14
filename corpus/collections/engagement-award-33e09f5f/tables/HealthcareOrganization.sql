CREATE TABLE HealthcareOrganization (
  id INTEGER NOT NULL,
  orgId VARCHAR(32),
  orgName VARCHAR(32),
  orgType VARCHAR(32),
  locationCity VARCHAR(32),
  locationState VARCHAR(32),
  foundedDate DATE,
  bedCount INTEGER,
  outputId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (outputId) REFERENCES ResearchOutput (id)
);
