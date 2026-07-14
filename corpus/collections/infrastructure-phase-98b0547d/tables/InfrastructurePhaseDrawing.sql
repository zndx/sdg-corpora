CREATE TABLE InfrastructurePhaseDrawing (
  phaseId INTEGER NOT NULL,
  drawingId INTEGER NOT NULL,
  PRIMARY KEY (phaseId, drawingId),
  FOREIGN KEY (phaseId) REFERENCES InfrastructurePhase (phaseId),
  FOREIGN KEY (drawingId) REFERENCES Drawing (id)
);
