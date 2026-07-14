CREATE TABLE LaserDiodeModule (
  id INTEGER NOT NULL,
  partNumber VARCHAR(32),
  centerWavelength DECIMAL,
  outputPower DECIMAL,
  monitorCurrent DECIMAL,
  thresholdCurrent DECIMAL,
  operatingCurrent DECIMAL,
  operatingVoltage DECIMAL,
  fiberLength DECIMAL,
  connectorId INTEGER,
  fiberId INTEGER,
  styleId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (connectorId) REFERENCES FiberConnector (connectorId),
  FOREIGN KEY (fiberId) REFERENCES OpticalFiber (fiberId),
  FOREIGN KEY (styleId) REFERENCES PackageStyle (styleId)
);
