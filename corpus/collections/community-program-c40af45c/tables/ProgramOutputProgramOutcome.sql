CREATE TABLE ProgramOutputProgramOutcome (
  outputId INTEGER NOT NULL,
  outcomeId INTEGER NOT NULL,
  PRIMARY KEY (outputId, outcomeId),
  FOREIGN KEY (outputId) REFERENCES ProgramOutput (id),
  FOREIGN KEY (outcomeId) REFERENCES ProgramOutcome (id)
);
