CREATE TABLE TargetSpot (
  id INTEGER NOT NULL,
  spotId VARCHAR(32),
  xCoordinate DECIMAL,
  yCoordinate DECIMAL,
  zCoordinate DECIMAL,
  surfaceType VARCHAR(32),
  distanceFromHole DECIMAL,
  PRIMARY KEY (id)
);
