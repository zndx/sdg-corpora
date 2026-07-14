CREATE TABLE CustomBackAssembly (
  assemblyId VARCHAR(44) NOT NULL,
  shellWidth DECIMAL,
  shellHeight DECIMAL,
  shellDepth DECIMAL,
  status VARCHAR(32),
  orderReference VARCHAR(32),
  manufactureLeadTime INTEGER,
  accountId INTEGER,
  PRIMARY KEY (assemblyId),
  FOREIGN KEY (accountId) REFERENCES ProviderAccount (accountId)
);
