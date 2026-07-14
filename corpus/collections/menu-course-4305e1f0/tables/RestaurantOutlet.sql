CREATE TABLE RestaurantOutlet (
  id INTEGER NOT NULL,
  outletId INTEGER,
  outletName VARCHAR(32),
  addressLine1 VARCHAR(32),
  city VARCHAR(32),
  postalCode VARCHAR(35),
  operatingHours VARCHAR(32),
  packageId INTEGER,
  staffId INTEGER,
  createdAt TIMESTAMP,
  updatedAt TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (packageId) REFERENCES DiningPackage (id),
  FOREIGN KEY (staffId) REFERENCES RestaurantStaff (id)
);
