CREATE TABLE UserDevice (
  id INTEGER NOT NULL,
  deviceId INTEGER,
  deviceType VARCHAR(32),
  osType VARCHAR(32),
  lastSyncDate TIMESTAMP,
  accountId INTEGER,
  applicationId INTEGER,
  createdAt TIMESTAMP,
  updatedAt TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (accountId) REFERENCES UserAccount (id),
  FOREIGN KEY (applicationId) REFERENCES SoftwareApplication (id)
);
