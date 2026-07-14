CREATE TABLE AirTrafficControllerFlightInformationRegion (
  controllerId VARCHAR(32) NOT NULL,
  regionId INTEGER NOT NULL,
  PRIMARY KEY (controllerId, regionId),
  FOREIGN KEY (controllerId) REFERENCES AirTrafficController (controllerId),
  FOREIGN KEY (regionId) REFERENCES FlightInformationRegion (regionId)
);
