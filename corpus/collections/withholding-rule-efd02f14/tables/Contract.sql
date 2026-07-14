CREATE TABLE Contract (
  id INTEGER NOT NULL,
  contractIdentifier VARCHAR(32),
  executionDate DATE,
  totalValue DECIMAL,
  contractType VARCHAR(32),
  isMateriallyModified BOOLEAN,
  modificationDate DATE,
  entityId INTEGER,
  contractorId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (entityId) REFERENCES GovernmentalEntity (entityId),
  FOREIGN KEY (contractorId) REFERENCES Contractor (contractorId)
);
