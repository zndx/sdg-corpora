CREATE TABLE ProviderAccount (
  accountId INTEGER NOT NULL,
  accountNumber VARCHAR(32),
  providerName VARCHAR(32),
  addressLine1 VARCHAR(32),
  addressLine2 VARCHAR(32),
  city VARCHAR(32),
  state VARCHAR(32),
  zipCode VARCHAR(44),
  country VARCHAR(32),
  phone VARCHAR(32),
  email VARCHAR(32),
  PRIMARY KEY (accountId)
);
