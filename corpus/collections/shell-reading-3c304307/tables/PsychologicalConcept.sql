CREATE TABLE PsychologicalConcept (
  id INTEGER NOT NULL,
  conceptId INTEGER,
  conceptName VARCHAR(32),
  category VARCHAR(32),
  severityLevel VARCHAR(32),
  shellId INTEGER,
  interpretationId VARCHAR(44),
  PRIMARY KEY (id),
  FOREIGN KEY (shellId) REFERENCES Shell (id),
  FOREIGN KEY (interpretationId) REFERENCES StudentInterpretation (interpretationId)
);
