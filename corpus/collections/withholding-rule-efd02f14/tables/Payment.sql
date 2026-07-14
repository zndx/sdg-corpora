CREATE TABLE Payment (
  id INTEGER NOT NULL,
  paymentIdentifier VARCHAR(32),
  amount DECIMAL,
  disbursementDate TIMESTAMP,
  paymentType VARCHAR(32),
  isWithheld BOOLEAN,
  withholdingAmount VARCHAR(32),
  entityId INTEGER,
  contractorId INTEGER,
  contractId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (entityId) REFERENCES GovernmentalEntity (entityId),
  FOREIGN KEY (contractorId) REFERENCES Contractor (contractorId),
  FOREIGN KEY (contractId) REFERENCES Contract (id)
);
