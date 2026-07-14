CREATE TABLE ClientProfile (
  id INTEGER NOT NULL,
  clientId VARCHAR(32),
  clientType VARCHAR(32),
  assetProtectionStatus VARCHAR(32),
  careerPhase VARCHAR(32),
  financialFootingStatus VARCHAR(32),
  advisorId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (advisorId) REFERENCES ProfessionalAdvisor (id)
);
