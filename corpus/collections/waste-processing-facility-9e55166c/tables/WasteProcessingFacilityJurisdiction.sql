CREATE TABLE WasteProcessingFacilityJurisdiction (
  facilityId VARCHAR(35) NOT NULL,
  jurisdictionId INTEGER NOT NULL,
  PRIMARY KEY (facilityId, jurisdictionId),
  FOREIGN KEY (facilityId) REFERENCES WasteProcessingFacility (facilityId),
  FOREIGN KEY (jurisdictionId) REFERENCES Jurisdiction (id)
);
