CREATE TABLE InfrastructurePhaseTestSheet (
  phaseId INTEGER NOT NULL,
  sheetTestSheetId VARCHAR(44) NOT NULL,
  PRIMARY KEY (phaseId, sheetTestSheetId),
  FOREIGN KEY (phaseId) REFERENCES InfrastructurePhase (phaseId),
  FOREIGN KEY (sheetTestSheetId) REFERENCES TestSheet (testSheetId)
);
