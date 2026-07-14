CREATE TABLE IntegratedWasteSystem (
  id INTEGER NOT NULL,
  systemId INTEGER,
  systemName VARCHAR(32),
  efficiencyRating DECIMAL,
  landfillCapacitySavedPercent DECIMAL,
  energyGeneratedMWh DECIMAL,
  lastAuditDate TIMESTAMP,
  facilityId VARCHAR(35),
  PRIMARY KEY (id),
  FOREIGN KEY (facilityId) REFERENCES WasteProcessingFacility (facilityId)
);
