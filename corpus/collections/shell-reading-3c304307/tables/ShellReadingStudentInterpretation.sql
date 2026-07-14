CREATE TABLE ShellReadingStudentInterpretation (
  readingId INTEGER NOT NULL,
  interpretationId VARCHAR(44) NOT NULL,
  PRIMARY KEY (readingId, interpretationId),
  FOREIGN KEY (readingId) REFERENCES ShellReading (id),
  FOREIGN KEY (interpretationId) REFERENCES StudentInterpretation (interpretationId)
);
