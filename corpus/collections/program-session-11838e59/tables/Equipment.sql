CREATE TABLE Equipment (
  id INTEGER NOT NULL,
  equipmentIdentifier VARCHAR(32),
  equipmentName VARCHAR(32),
  equipmentType VARCHAR(32),
  isSkidFree BOOLEAN,
  isChangingTable BOOLEAN,
  roomId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (roomId) REFERENCES Room (id)
);
