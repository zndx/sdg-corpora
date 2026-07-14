CREATE TABLE WasteStream (
  id INTEGER NOT NULL,
  streamId VARCHAR(44),
  streamType VARCHAR(32),
  sourceJurisdiction VARCHAR(32),
  deliveryFrequency VARCHAR(32),
  averageWeightTons DECIMAL,
  contaminationRatePercent DECIMAL,
  facilityId VARCHAR(35),
  systemId INTEGER,
  createdAt TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (facilityId) REFERENCES WasteProcessingFacility (facilityId),
  FOREIGN KEY (systemId) REFERENCES IntegratedWasteSystem (id)
);
