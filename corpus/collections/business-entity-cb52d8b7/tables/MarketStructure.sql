CREATE TABLE MarketStructure (
  id INTEGER NOT NULL,
  structureType VARCHAR(32),
  numberOfFirms INTEGER,
  barrierToEntry VARCHAR(32),
  priceControl BOOLEAN,
  productDifferentiation VARCHAR(32),
  entityId INTEGER,
  policyId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (entityId) REFERENCES BusinessEntity (id),
  FOREIGN KEY (policyId) REFERENCES GovernmentPolicy (policyId)
);
