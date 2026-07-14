CREATE TABLE ManufacturingOrder (
  orderId INTEGER NOT NULL,
  orderNumber VARCHAR(32),
  orderDate TIMESTAMP,
  orderType VARCHAR(32),
  poNumber VARCHAR(32),
  specialInstructions VARCHAR(32),
  assemblyId VARCHAR(44),
  accountId INTEGER,
  PRIMARY KEY (orderId),
  FOREIGN KEY (assemblyId) REFERENCES CustomBackAssembly (assemblyId),
  FOREIGN KEY (accountId) REFERENCES ProviderAccount (accountId)
);
