CREATE TABLE PowerGridEnergyOutput (
  gridId VARCHAR(44) NOT NULL,
  outputId INTEGER NOT NULL,
  PRIMARY KEY (gridId, outputId),
  FOREIGN KEY (gridId) REFERENCES PowerGrid (gridId),
  FOREIGN KEY (outputId) REFERENCES EnergyOutput (id)
);
