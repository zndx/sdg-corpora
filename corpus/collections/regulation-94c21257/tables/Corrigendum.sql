CREATE TABLE Corrigendum (
  corrigendumId INTEGER NOT NULL,
  identifier VARCHAR(32),
  issueNumber INTEGER,
  submissionDate DATE,
  proposingEntity VARCHAR(32),
  status VARCHAR(32),
  regulationId INTEGER,
  protocolId INTEGER,
  PRIMARY KEY (corrigendumId),
  FOREIGN KEY (regulationId) REFERENCES Regulation (regulationId),
  FOREIGN KEY (protocolId) REFERENCES TestProtocol (protocolId)
);
