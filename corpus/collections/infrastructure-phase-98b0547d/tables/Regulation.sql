CREATE TABLE Regulation (
  id INTEGER NOT NULL,
  ruleId INTEGER,
  ruleNumber VARCHAR(32),
  ruleTitle VARCHAR(32),
  effectiveDate DATE,
  issuingAuthority VARCHAR(32),
  isElectronicRequired BOOLEAN,
  scope VARCHAR(32),
  sheetTestSheetId VARCHAR(44),
  drawingId INTEGER,
  phaseId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (sheetTestSheetId) REFERENCES TestSheet (testSheetId),
  FOREIGN KEY (drawingId) REFERENCES Drawing (id),
  FOREIGN KEY (phaseId) REFERENCES InfrastructurePhase (phaseId)
);
