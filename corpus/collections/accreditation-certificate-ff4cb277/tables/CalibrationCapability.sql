CREATE TABLE CalibrationCapability (
  id INTEGER NOT NULL,
  parameterName VARCHAR(32),
  equipmentType VARCHAR(32),
  measurementRangeMin DECIMAL,
  measurementRangeMax DECIMAL,
  unitOfMeasurement VARCHAR(32),
  expandedUncertaintyValue DECIMAL,
  coverageFactor DECIMAL,
  scopeId INTEGER,
  standardId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (scopeId) REFERENCES AccreditationScope (scopeId),
  FOREIGN KEY (standardId) REFERENCES MeasurementStandard (id)
);
