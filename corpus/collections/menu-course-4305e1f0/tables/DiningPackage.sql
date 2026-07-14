CREATE TABLE DiningPackage (
  id INTEGER NOT NULL,
  packageId VARCHAR(32),
  packageName VARCHAR(32),
  totalPrice DECIMAL,
  currencyCode VARCHAR(44),
  includesChampagneCocktail BOOLEAN,
  serviceChargePercentage DECIMAL,
  outletId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (outletId) REFERENCES RestaurantOutlet (id)
);
