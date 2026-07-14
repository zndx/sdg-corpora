CREATE TABLE FacilityRoom (
  facilityId INTEGER NOT NULL,
  roomId INTEGER NOT NULL,
  PRIMARY KEY (facilityId, roomId),
  FOREIGN KEY (facilityId) REFERENCES Facility (facilityId),
  FOREIGN KEY (roomId) REFERENCES Room (id)
);
