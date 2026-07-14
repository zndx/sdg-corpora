CREATE TABLE WasteProcessingFacilityStaffMember (
  facilityId VARCHAR(35) NOT NULL,
  memberId INTEGER NOT NULL,
  PRIMARY KEY (facilityId, memberId),
  FOREIGN KEY (facilityId) REFERENCES WasteProcessingFacility (facilityId),
  FOREIGN KEY (memberId) REFERENCES StaffMember (id)
);
