CREATE TABLE PracticeRoutine (
  id INTEGER NOT NULL,
  routineId VARCHAR(44),
  routineName VARCHAR(32),
  focusArea VARCHAR(32),
  isQualityFocused BOOLEAN,
  mechanicsId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (mechanicsId) REFERENCES GripMechanics (id)
);
