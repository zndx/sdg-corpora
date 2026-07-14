CREATE TABLE Committee (
  committeeName VARCHAR(32),
  committeeCode VARCHAR(44) NOT NULL,
  meetingFrequency INTEGER,
  meetingTime VARCHAR(32),
  meetingLocation VARCHAR(32),
  appointmentMonth INTEGER,
  locationId INTEGER,
  createdAt TIMESTAMP,
  updatedAt TIMESTAMP,
  PRIMARY KEY (committeeCode),
  FOREIGN KEY (locationId) REFERENCES Location (id)
);
