CREATE TABLE HuntingPackage (
  packageId INTEGER NOT NULL,
  packageName VARCHAR(32),
  totalPrice DECIMAL,
  currency VARCHAR(32),
  durationNights INTEGER,
  durationDays INTEGER,
  status VARCHAR(32),
  accommodationId INTEGER,
  PRIMARY KEY (packageId),
  FOREIGN KEY (accommodationId) REFERENCES Accommodation (id)
);
