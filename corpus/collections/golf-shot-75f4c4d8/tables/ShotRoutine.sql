CREATE TABLE ShotRoutine (
  routineId INTEGER NOT NULL,
  routineName VARCHAR(32),
  steps VARCHAR(32),
  duration DECIMAL,
  successRate DECIMAL,
  techniqueId VARCHAR(44),
  procedureId VARCHAR(32),
  setupId INTEGER,
  PRIMARY KEY (routineId),
  FOREIGN KEY (techniqueId) REFERENCES GripTechnique (techniqueId),
  FOREIGN KEY (procedureId) REFERENCES AimProcedure (procedureId),
  FOREIGN KEY (setupId) REFERENCES PostureSetup (id)
);
