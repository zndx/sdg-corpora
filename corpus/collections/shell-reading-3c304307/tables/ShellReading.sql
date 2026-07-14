CREATE TABLE ShellReading (
  id INTEGER NOT NULL,
  readingId INTEGER,
  clientName VARCHAR(32),
  sessionDate TIMESTAMP,
  primaryTheme VARCHAR(32),
  emotionalValence VARCHAR(32),
  interpretationConfidence DECIMAL,
  PRIMARY KEY (id)
);
