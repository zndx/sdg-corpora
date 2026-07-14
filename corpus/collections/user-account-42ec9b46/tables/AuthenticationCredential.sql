CREATE TABLE AuthenticationCredential (
  credentialId VARCHAR(35) NOT NULL,
  credentialType VARCHAR(32),
  isTemporary BOOLEAN,
  issueDate TIMESTAMP,
  expiryDate TIMESTAMP,
  accountId INTEGER,
  serviceId INTEGER,
  PRIMARY KEY (credentialId),
  FOREIGN KEY (accountId) REFERENCES UserAccount (id),
  FOREIGN KEY (serviceId) REFERENCES DigitalService (id)
);
