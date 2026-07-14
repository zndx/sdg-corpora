CREATE TABLE StaffMember (
  id INTEGER NOT NULL,
  staffId INTEGER,
  firstName VARCHAR(32),
  lastName VARCHAR(32),
  hireDate TIMESTAMP,
  employmentStatus VARCHAR(32),
  contactEmail VARCHAR(32),
  positionId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (positionId) REFERENCES StaffPosition (id)
);
