CREATE TABLE JurisdictionWasteProcessingFacility (
  jurisdictionId INTEGER NOT NULL,
  facilityId VARCHAR(35) NOT NULL,
  PRIMARY KEY (jurisdictionId, facilityId),
  FOREIGN KEY (jurisdictionId) REFERENCES Jurisdiction (id),
  FOREIGN KEY (facilityId) REFERENCES WasteProcessingFacility (facilityId)
);
