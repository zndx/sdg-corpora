CREATE TABLE Fisherman (
  id INTEGER NOT NULL,
  fishermanId VARCHAR(32),
  name VARCHAR(32),
  registrationNumber VARCHAR(32),
  state VARCHAR(32),
  yearsOfExperience INTEGER,
  status VARCHAR(32),
  zoneId VARCHAR(44),
  PRIMARY KEY (id),
  FOREIGN KEY (zoneId) REFERENCES SpatialZone (zoneId)
);
