CREATE TABLE StaffMember (
  id INTEGER NOT NULL,
  staffId INTEGER,
  fullName VARCHAR(36),
  roleTitle VARCHAR(32),
  employmentStatus VARCHAR(32),
  yearsOfExperience INTEGER,
  educationLevel VARCHAR(32),
  facilityId VARCHAR(35),
  memberId INTEGER,
  systemId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (facilityId) REFERENCES WasteProcessingFacility (facilityId),
  FOREIGN KEY (memberId) REFERENCES StaffMember (id),
  FOREIGN KEY (systemId) REFERENCES IntegratedWasteSystem (id)
);
