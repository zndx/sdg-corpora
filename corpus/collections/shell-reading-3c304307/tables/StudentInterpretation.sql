CREATE TABLE StudentInterpretation (
  interpretationId VARCHAR(44) NOT NULL,
  studentName VARCHAR(32),
  interpretationText VARCHAR(32),
  certaintyLevel VARCHAR(32),
  recordedDate TIMESTAMP,
  isJournalEntry BOOLEAN,
  readingId INTEGER,
  conceptId INTEGER,
  PRIMARY KEY (interpretationId),
  FOREIGN KEY (readingId) REFERENCES ShellReading (id),
  FOREIGN KEY (conceptId) REFERENCES PsychologicalConcept (id)
);
