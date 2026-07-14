CREATE TABLE WasteProcessingFacility (
  facilityId VARCHAR(35) NOT NULL,
  facilityName VARCHAR(32),
  location VARCHAR(32),
  operationalStatus VARCHAR(32),
  wasteCapacityTonsPerDay DECIMAL,
  energyOutputMWhPerDay DECIMAL,
  lastInspectionDate TIMESTAMP,
  PRIMARY KEY (facilityId)
);
