CREATE TABLE TrainingSession (
  sessionId INTEGER NOT NULL,
  sessionTitle VARCHAR(32),
  durationMinutes INTEGER,
  classLevel VARCHAR(32),
  instructorName VARCHAR(32),
  sessionStatus VARCHAR(32),
  readingId INTEGER,
  createdAt TIMESTAMP,
  updatedAt TIMESTAMP,
  PRIMARY KEY (sessionId),
  FOREIGN KEY (readingId) REFERENCES ShellReading (id)
);
