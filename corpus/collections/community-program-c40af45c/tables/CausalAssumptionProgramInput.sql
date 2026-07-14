CREATE TABLE CausalAssumptionProgramInput (
  assumptionId INTEGER NOT NULL,
  inputId INTEGER NOT NULL,
  PRIMARY KEY (assumptionId, inputId),
  FOREIGN KEY (assumptionId) REFERENCES CausalAssumption (assumptionId),
  FOREIGN KEY (inputId) REFERENCES ProgramInput (id)
);
