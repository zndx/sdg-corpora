CREATE TABLE AuthorisedUser (
  id INTEGER NOT NULL,
  userName VARCHAR(32),
  userRole VARCHAR(32),
  isConcurrent BOOLEAN,
  customerRegistrationNumber VARCHAR(32),
  softwareId INTEGER,
  sessionId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (customerRegistrationNumber) REFERENCES Customer (registrationNumber),
  FOREIGN KEY (softwareId) REFERENCES LicensedSoftware (id),
  FOREIGN KEY (sessionId) REFERENCES UserSession (id)
);
