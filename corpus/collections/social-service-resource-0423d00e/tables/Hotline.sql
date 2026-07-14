CREATE TABLE Hotline (
  id INTEGER NOT NULL,
  phoneNumber VARCHAR(32),
  smsKeyword VARCHAR(32),
  hotlineType VARCHAR(32),
  isAvailable247 BOOLEAN,
  isConfidential BOOLEAN,
  organizationId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (organizationId) REFERENCES ServiceOrganization (id)
);
