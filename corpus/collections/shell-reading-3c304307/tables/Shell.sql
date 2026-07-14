CREATE TABLE Shell (
  id INTEGER NOT NULL,
  shellId INTEGER,
  catalogNumber INTEGER,
  commonName VARCHAR(32),
  symbolicMeaning VARCHAR(32),
  speciesType VARCHAR(32),
  readingId INTEGER,
  conceptId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (readingId) REFERENCES ShellReading (id),
  FOREIGN KEY (conceptId) REFERENCES PsychologicalConcept (id)
);
