CREATE TABLE HealthcareOrganizationAdvisoryCouncil (
  organizationId INTEGER NOT NULL,
  councilId INTEGER NOT NULL,
  PRIMARY KEY (organizationId, councilId),
  FOREIGN KEY (organizationId) REFERENCES HealthcareOrganization (id),
  FOREIGN KEY (councilId) REFERENCES AdvisoryCouncil (id)
);
