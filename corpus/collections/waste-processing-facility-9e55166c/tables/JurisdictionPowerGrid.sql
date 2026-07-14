CREATE TABLE JurisdictionPowerGrid (
  jurisdictionId INTEGER NOT NULL,
  gridId VARCHAR(44) NOT NULL,
  PRIMARY KEY (jurisdictionId, gridId),
  FOREIGN KEY (jurisdictionId) REFERENCES Jurisdiction (id),
  FOREIGN KEY (gridId) REFERENCES PowerGrid (gridId)
);
