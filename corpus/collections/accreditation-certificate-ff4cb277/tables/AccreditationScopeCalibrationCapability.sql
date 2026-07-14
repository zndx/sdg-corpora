CREATE TABLE AccreditationScopeCalibrationCapability (
  scopeId INTEGER NOT NULL,
  capabilityId INTEGER NOT NULL,
  PRIMARY KEY (scopeId, capabilityId),
  FOREIGN KEY (scopeId) REFERENCES AccreditationScope (scopeId),
  FOREIGN KEY (capabilityId) REFERENCES CalibrationCapability (id)
);
