CREATE TABLE Contractor (
  contractorId INTEGER NOT NULL,
  contractorIdentifier VARCHAR(32),
  contractorName VARCHAR(32),
  contractorType VARCHAR(32),
  taxIdentificationNumber VARCHAR(32),
  createdAt TIMESTAMP,
  updatedAt TIMESTAMP,
  PRIMARY KEY (contractorId)
);
