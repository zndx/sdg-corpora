CREATE TABLE AircraftFlightInformationRegion (
  aircraftId INTEGER NOT NULL,
  regionId INTEGER NOT NULL,
  PRIMARY KEY (aircraftId, regionId),
  FOREIGN KEY (aircraftId) REFERENCES Aircraft (id),
  FOREIGN KEY (regionId) REFERENCES FlightInformationRegion (regionId)
);
