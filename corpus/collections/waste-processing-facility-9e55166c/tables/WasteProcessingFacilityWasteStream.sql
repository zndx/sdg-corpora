CREATE TABLE WasteProcessingFacilityWasteStream (
  facilityId VARCHAR(35) NOT NULL,
  streamId INTEGER NOT NULL,
  PRIMARY KEY (facilityId, streamId),
  FOREIGN KEY (facilityId) REFERENCES WasteProcessingFacility (facilityId),
  FOREIGN KEY (streamId) REFERENCES WasteStream (id)
);
