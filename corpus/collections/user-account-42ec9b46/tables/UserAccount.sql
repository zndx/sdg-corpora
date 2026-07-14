CREATE TABLE UserAccount (
  id INTEGER NOT NULL,
  accountId VARCHAR(44),
  username VARCHAR(32),
  temporaryPassword VARCHAR(32),
  status VARCHAR(32),
  enrollmentDate TIMESTAMP,
  lastLoginTimestamp TIMESTAMP,
  credentialId VARCHAR(35),
  serviceId INTEGER,
  deviceId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (credentialId) REFERENCES AuthenticationCredential (credentialId),
  FOREIGN KEY (serviceId) REFERENCES DigitalService (id),
  FOREIGN KEY (deviceId) REFERENCES UserDevice (id)
);
