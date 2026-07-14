CREATE TABLE PracticeRoutineGolfShot (
  routineId INTEGER NOT NULL,
  shotId INTEGER NOT NULL,
  PRIMARY KEY (routineId, shotId),
  FOREIGN KEY (routineId) REFERENCES PracticeRoutine (id),
  FOREIGN KEY (shotId) REFERENCES GolfShot (shotId)
);
