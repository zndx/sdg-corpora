CREATE TABLE TrainingSessionStudentInterpretation (
  sessionId INTEGER NOT NULL,
  interpretationId VARCHAR(44) NOT NULL,
  PRIMARY KEY (sessionId, interpretationId),
  FOREIGN KEY (sessionId) REFERENCES TrainingSession (sessionId),
  FOREIGN KEY (interpretationId) REFERENCES StudentInterpretation (interpretationId)
);
