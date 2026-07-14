CREATE TABLE InsulationTubingTestMethod (
  tubingId INTEGER NOT NULL,
  methodId INTEGER NOT NULL,
  PRIMARY KEY (tubingId, methodId),
  FOREIGN KEY (tubingId) REFERENCES InsulationTubing (tubingId),
  FOREIGN KEY (methodId) REFERENCES TestMethod (methodId)
);
