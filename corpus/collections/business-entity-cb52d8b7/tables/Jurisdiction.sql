CREATE TABLE Jurisdiction (
  countryCode VARCHAR(32) NOT NULL,
  countryName VARCHAR(32),
  registrationAuthority VARCHAR(32),
  taxRate DECIMAL,
  legalFrameworkVersion VARCHAR(32),
  entityId INTEGER,
  PRIMARY KEY (countryCode),
  FOREIGN KEY (entityId) REFERENCES BusinessEntity (id)
);
