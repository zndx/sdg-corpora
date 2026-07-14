CREATE TABLE LicensedSoftware (
  id INTEGER NOT NULL,
  softwareName VARCHAR(32),
  versionNumber VARCHAR(32),
  isCloudService BOOLEAN,
  lastUpdated TIMESTAMP,
  keyId INTEGER,
  userId INTEGER,
  createdAt TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (keyId) REFERENCES ActivationKey (id),
  FOREIGN KEY (userId) REFERENCES AuthorisedUser (id)
);
