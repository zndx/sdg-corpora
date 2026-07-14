CREATE TABLE OperatingCondition (
  id INTEGER NOT NULL,
  operatingTemperature DECIMAL,
  storageTemperature DECIMAL,
  solderingTemperature DECIMAL,
  reverseVoltage DECIMAL,
  moduleId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (moduleId) REFERENCES LaserDiodeModule (id)
);
