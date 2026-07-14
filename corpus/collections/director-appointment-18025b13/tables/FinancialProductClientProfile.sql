CREATE TABLE FinancialProductClientProfile (
  productId INTEGER NOT NULL,
  profileId INTEGER NOT NULL,
  PRIMARY KEY (productId, profileId),
  FOREIGN KEY (productId) REFERENCES FinancialProduct (productId),
  FOREIGN KEY (profileId) REFERENCES ClientProfile (id)
);
