CREATE TABLE Regulation (
  regulationId INTEGER NOT NULL,
  identifier VARCHAR(32),
  title VARCHAR(32),
  status VARCHAR(32),
  effectiveDate DATE,
  issuingBody VARCHAR(32),
  corrigendumId INTEGER,
  typeId INTEGER,
  supersededByRegulationId INTEGER,
  PRIMARY KEY (regulationId),
  FOREIGN KEY (corrigendumId) REFERENCES Corrigendum (corrigendumId),
  FOREIGN KEY (typeId) REFERENCES TyreType (id),
  FOREIGN KEY (supersededByRegulationId) REFERENCES Regulation (regulationId)
);
