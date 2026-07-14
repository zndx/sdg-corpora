CREATE TABLE FinancialProduct (
  productId INTEGER NOT NULL,
  productName VARCHAR(32),
  productCategory VARCHAR(32),
  availabilityScope VARCHAR(32),
  targetSegment VARCHAR(32),
  advisorId INTEGER,
  PRIMARY KEY (productId),
  FOREIGN KEY (advisorId) REFERENCES ProfessionalAdvisor (id)
);
