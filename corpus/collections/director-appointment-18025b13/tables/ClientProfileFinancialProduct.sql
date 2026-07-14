CREATE TABLE ClientProfileFinancialProduct (
  profileId INTEGER NOT NULL,
  productId INTEGER NOT NULL,
  PRIMARY KEY (profileId, productId),
  FOREIGN KEY (profileId) REFERENCES ClientProfile (id),
  FOREIGN KEY (productId) REFERENCES FinancialProduct (productId)
);
