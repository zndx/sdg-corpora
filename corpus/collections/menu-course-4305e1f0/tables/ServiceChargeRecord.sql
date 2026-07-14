CREATE TABLE ServiceChargeRecord (
  id INTEGER NOT NULL,
  recordId INTEGER,
  transactionDate TIMESTAMP,
  totalChargeAmount VARCHAR(32),
  chargePercentage DECIMAL,
  paymentMethod VARCHAR(32),
  isDeductedByCompany VARCHAR(41),
  packageId INTEGER,
  staffId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (packageId) REFERENCES DiningPackage (id),
  FOREIGN KEY (staffId) REFERENCES RestaurantStaff (id)
);
