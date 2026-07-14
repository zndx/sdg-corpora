CREATE TABLE MaterialSpecification (
  id INTEGER NOT NULL,
  specId VARCHAR(32),
  tensileStrength DECIMAL,
  elongationAtBreak DECIMAL,
  dielectricStrength DECIMAL,
  dielectricConstant DECIMAL,
  volumeResistance DECIMAL,
  oxygenIndex DECIMAL,
  copperCorrosionRate DECIMAL,
  coldBendTemperature DECIMAL,
  tubingId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (tubingId) REFERENCES InsulationTubing (tubingId)
);
