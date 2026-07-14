CREATE TABLE GovernmentalEntityContract (
  entityId INTEGER NOT NULL,
  contractId INTEGER NOT NULL,
  PRIMARY KEY (entityId, contractId),
  FOREIGN KEY (entityId) REFERENCES GovernmentalEntity (entityId),
  FOREIGN KEY (contractId) REFERENCES Contract (id)
);
