CREATE TABLE IntegratedWasteSystemEnergyOutput (
  systemId INTEGER NOT NULL,
  outputId INTEGER NOT NULL,
  PRIMARY KEY (systemId, outputId),
  FOREIGN KEY (systemId) REFERENCES IntegratedWasteSystem (id),
  FOREIGN KEY (outputId) REFERENCES EnergyOutput (id)
);
