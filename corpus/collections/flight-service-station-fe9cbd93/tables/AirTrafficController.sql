CREATE TABLE AirTrafficController (
  controllerId VARCHAR(32) NOT NULL,
  firstName VARCHAR(32),
  lastName VARCHAR(32),
  shiftType VARCHAR(32),
  yearsOfExperience INTEGER,
  certificationLevel VARCHAR(32),
  currentAssignment VARCHAR(32),
  contactMethod VARCHAR(32),
  stationId INTEGER,
  PRIMARY KEY (controllerId),
  FOREIGN KEY (stationId) REFERENCES FlightServiceStation (stationId)
);
