CREATE TABLE Customer (
  customerType VARCHAR(32),
  legalName VARCHAR(32),
  registrationNumber VARCHAR(32) NOT NULL,
  registeredAddress VARCHAR(32),
  keyId INTEGER,
  userId INTEGER,
  PRIMARY KEY (registrationNumber),
  FOREIGN KEY (keyId) REFERENCES ActivationKey (id),
  FOREIGN KEY (userId) REFERENCES AuthorisedUser (id)
);
