CREATE TABLE GolfClub (
  id INTEGER NOT NULL,
  clubId VARCHAR(32),
  clubType VARCHAR(32),
  loftAngle DECIMAL,
  shaftLength DECIMAL,
  gripStyle VARCHAR(32),
  shotId INTEGER,
  createdAt TIMESTAMP,
  updatedAt TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (shotId) REFERENCES GolfShot (shotId)
);
