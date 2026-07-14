CREATE TABLE UserDocument (
  documentId INTEGER NOT NULL,
  fileName VARCHAR(32),
  fileType VARCHAR(32),
  lastModified TIMESTAMP,
  isSynced BOOLEAN,
  accountId INTEGER,
  storageId INTEGER,
  applicationId INTEGER,
  PRIMARY KEY (documentId),
  FOREIGN KEY (accountId) REFERENCES UserAccount (id),
  FOREIGN KEY (storageId) REFERENCES CloudStorage (id),
  FOREIGN KEY (applicationId) REFERENCES SoftwareApplication (id)
);
