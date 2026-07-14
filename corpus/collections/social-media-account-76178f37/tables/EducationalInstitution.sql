CREATE TABLE EducationalInstitution (
  institutionId INTEGER NOT NULL,
  institutionName VARCHAR(32),
  institutionType VARCHAR(32),
  address VARCHAR(32),
  principalName VARCHAR(32),
  dateEstablished DATE,
  registerId INTEGER,
  policyId INTEGER,
  PRIMARY KEY (institutionId),
  FOREIGN KEY (registerId) REFERENCES AccountRegister (registerId),
  FOREIGN KEY (policyId) REFERENCES SocialMediaPolicy (policyId)
);
