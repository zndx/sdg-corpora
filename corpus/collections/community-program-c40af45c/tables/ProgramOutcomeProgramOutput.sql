CREATE TABLE ProgramOutcomeProgramOutput (
  outcomeId INTEGER NOT NULL,
  outputId INTEGER NOT NULL,
  PRIMARY KEY (outcomeId, outputId),
  FOREIGN KEY (outcomeId) REFERENCES ProgramOutcome (id),
  FOREIGN KEY (outputId) REFERENCES ProgramOutput (id)
);
