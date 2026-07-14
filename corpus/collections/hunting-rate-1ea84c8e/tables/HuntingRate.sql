CREATE TABLE HuntingRate (
  id INTEGER NOT NULL,
  rateId INTEGER,
  rateType VARCHAR(32),
  dailyFee DECIMAL,
  currency VARCHAR(32),
  validFrom DATE,
  validTo DATE,
  packageId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (packageId) REFERENCES HuntingPackage (packageId)
);
