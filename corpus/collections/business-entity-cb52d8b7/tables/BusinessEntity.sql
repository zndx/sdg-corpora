CREATE TABLE BusinessEntity (
  id INTEGER NOT NULL,
  registrationNumber VARCHAR(32),
  legalForm VARCHAR(33),
  registrationDate TIMESTAMP,
  jurisdiction VARCHAR(32),
  status VARCHAR(32),
  taxIdentificationNumber VARCHAR(32),
  jurisdictionCountryCode VARCHAR(32),
  structureId INTEGER,
  statementId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (jurisdictionCountryCode) REFERENCES Jurisdiction (countryCode),
  FOREIGN KEY (structureId) REFERENCES MarketStructure (id),
  FOREIGN KEY (statementId) REFERENCES FinancialStatement (statementId)
);
