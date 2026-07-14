CREATE TABLE OtherPermit (
  id INTEGER NOT NULL,
  permitName VARCHAR(32),
  issuingAuthority VARCHAR(32),
  permitNumber VARCHAR(32),
  status VARCHAR(32),
  applicationId VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (applicationId) REFERENCES PermitApplication (applicationId)
);
