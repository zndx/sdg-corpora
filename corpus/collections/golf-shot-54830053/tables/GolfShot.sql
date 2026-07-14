CREATE TABLE GolfShot (
  shotId INTEGER NOT NULL,
  shotIdentifier VARCHAR(32),
  shotType VARCHAR(32),
  targetDistance DECIMAL,
  targetDirection VARCHAR(32),
  executionStatus VARCHAR(32),
  practiceSessionId VARCHAR(44),
  clubId INTEGER,
  spotId VARCHAR(32),
  routineId INTEGER,
  PRIMARY KEY (shotId),
  FOREIGN KEY (clubId) REFERENCES GolfClub (id),
  FOREIGN KEY (spotId) REFERENCES LandingSpot (spotId),
  FOREIGN KEY (routineId) REFERENCES PracticeRoutine (id)
);
