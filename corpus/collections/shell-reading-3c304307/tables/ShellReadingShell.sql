CREATE TABLE ShellReadingShell (
  readingId INTEGER NOT NULL,
  shellId INTEGER NOT NULL,
  PRIMARY KEY (readingId, shellId),
  FOREIGN KEY (readingId) REFERENCES ShellReading (id),
  FOREIGN KEY (shellId) REFERENCES Shell (id)
);
