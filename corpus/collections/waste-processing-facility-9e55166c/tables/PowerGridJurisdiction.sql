CREATE TABLE PowerGridJurisdiction (
  gridId VARCHAR(44) NOT NULL,
  jurisdictionId INTEGER NOT NULL,
  PRIMARY KEY (gridId, jurisdictionId),
  FOREIGN KEY (gridId) REFERENCES PowerGrid (gridId),
  FOREIGN KEY (jurisdictionId) REFERENCES Jurisdiction (id)
);
