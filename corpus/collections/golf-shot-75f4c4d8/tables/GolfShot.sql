CREATE TABLE GolfShot (
  shotId INTEGER NOT NULL,
  shotType VARCHAR(32),
  distance DECIMAL,
  direction VARCHAR(32),
  decision VARCHAR(32),
  outcome VARCHAR(32),
  observedResult VARCHAR(32),
  clubId INTEGER,
  golferId INTEGER,
  spotId INTEGER,
  PRIMARY KEY (shotId),
  FOREIGN KEY (clubId) REFERENCES GolfClub (id),
  FOREIGN KEY (golferId) REFERENCES Golfer (golferId),
  FOREIGN KEY (spotId) REFERENCES TargetSpot (id)
);
