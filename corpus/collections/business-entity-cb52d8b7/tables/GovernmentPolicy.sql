CREATE TABLE GovernmentPolicy (
  policyId INTEGER NOT NULL,
  policyType VARCHAR(34),
  issuingAuthority VARCHAR(32),
  effectiveDate DATE,
  expirationDate DATE,
  targetSector VARCHAR(32),
  entityId INTEGER,
  jurisdictionCountryCode VARCHAR(32),
  businessId INTEGER,
  PRIMARY KEY (policyId),
  FOREIGN KEY (entityId) REFERENCES BusinessEntity (id),
  FOREIGN KEY (jurisdictionCountryCode) REFERENCES Jurisdiction (countryCode),
  FOREIGN KEY (businessId) REFERENCES InnovativeBusiness (businessId)
);
