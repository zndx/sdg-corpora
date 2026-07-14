CREATE TABLE Room (
  id INTEGER NOT NULL,
  roomIdentifier VARCHAR(32),
  roomName VARCHAR(32),
  roomType VARCHAR(32),
  hasChangingTables BOOLEAN,
  allowsFood BOOLEAN,
  requiresShoeRemoval BOOLEAN,
  facilityId INTEGER,
  equipmentId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (facilityId) REFERENCES Facility (facilityId),
  FOREIGN KEY (equipmentId) REFERENCES Equipment (id)
);
