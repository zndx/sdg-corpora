CREATE TABLE ContractorContract (
  contractorId INTEGER NOT NULL,
  contractId INTEGER NOT NULL,
  PRIMARY KEY (contractorId, contractId),
  FOREIGN KEY (contractorId) REFERENCES Contractor (contractorId),
  FOREIGN KEY (contractId) REFERENCES Contract (id)
);
