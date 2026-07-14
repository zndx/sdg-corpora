CREATE TABLE MeasurementStandard (
  id INTEGER NOT NULL,
  standardIdentifier VARCHAR(32),
  standardType VARCHAR(32),
  manufacturer VARCHAR(46),
  calibrationDueDate DATE,
  status VARCHAR(32),
  capabilityId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (capabilityId) REFERENCES CalibrationCapability (id)
);
