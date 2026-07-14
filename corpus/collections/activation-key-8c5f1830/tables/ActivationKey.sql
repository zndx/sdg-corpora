CREATE TABLE ActivationKey (
  id INTEGER NOT NULL,
  keyString VARCHAR(32),
  issuedDate TIMESTAMP,
  licenseType VARCHAR(32),
  licensePeriodStart DATE,
  licensePeriodEnd DATE,
  maxConcurrentSessions INTEGER,
  softwareId INTEGER,
  customerRegistrationNumber VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (softwareId) REFERENCES LicensedSoftware (id),
  FOREIGN KEY (customerRegistrationNumber) REFERENCES Customer (registrationNumber)
);
