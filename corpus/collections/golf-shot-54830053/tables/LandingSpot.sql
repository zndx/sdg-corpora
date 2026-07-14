CREATE TABLE LandingSpot (
  spotId VARCHAR(32) NOT NULL,
  distanceFromBall DECIMAL,
  surfaceType VARCHAR(32),
  elevationChange DECIMAL,
  shotId INTEGER,
  PRIMARY KEY (spotId),
  FOREIGN KEY (shotId) REFERENCES GolfShot (shotId)
);
