CREATE TABLE InnovativeBusiness (
  businessId INTEGER NOT NULL,
  innovationType VARCHAR(32),
  patentCount INTEGER,
  rAndDInvestment DECIMAL,
  marketShare DECIMAL,
  growthRate DECIMAL,
  entityId INTEGER,
  propertyId INTEGER,
  policyId INTEGER,
  PRIMARY KEY (businessId),
  FOREIGN KEY (entityId) REFERENCES BusinessEntity (id),
  FOREIGN KEY (propertyId) REFERENCES IntellectualProperty (propertyId),
  FOREIGN KEY (policyId) REFERENCES GovernmentPolicy (policyId)
);
