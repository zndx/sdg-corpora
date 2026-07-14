CREATE TABLE ProviderAccountCustomBackAssembly (
  accountId INTEGER NOT NULL,
  assemblyId VARCHAR(44) NOT NULL,
  PRIMARY KEY (accountId, assemblyId),
  FOREIGN KEY (accountId) REFERENCES ProviderAccount (accountId),
  FOREIGN KEY (assemblyId) REFERENCES CustomBackAssembly (assemblyId)
);
