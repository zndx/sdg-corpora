CREATE TABLE EnergyOutput (
  id INTEGER NOT NULL,
  outputId VARCHAR(44),
  energyType VARCHAR(32),
  quantityMWh DECIMAL,
  gridConnectionStatus VARCHAR(32),
  qualityStandard VARCHAR(32),
  measurementDate TIMESTAMP,
  systemId INTEGER,
  gridId VARCHAR(44),
  createdAt TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (systemId) REFERENCES IntegratedWasteSystem (id),
  FOREIGN KEY (gridId) REFERENCES PowerGrid (gridId)
);
