CREATE TABLE GripMechanics (
  id INTEGER NOT NULL,
  mechanicId VARCHAR(35),
  handPlacement VARCHAR(32),
  pressureLevel VARCHAR(32),
  musclePadContact VARCHAR(32),
  clubId INTEGER,
  shotId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (clubId) REFERENCES GolfClub (id),
  FOREIGN KEY (shotId) REFERENCES GolfShot (shotId)
);
