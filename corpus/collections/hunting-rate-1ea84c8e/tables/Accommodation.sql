CREATE TABLE Accommodation (
  id INTEGER NOT NULL,
  accommodationId VARCHAR(44),
  accommodationType VARCHAR(32),
  location VARCHAR(32),
  nightsIncluded INTEGER,
  mealPlan VARCHAR(32),
  packageId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (packageId) REFERENCES HuntingPackage (packageId)
);
