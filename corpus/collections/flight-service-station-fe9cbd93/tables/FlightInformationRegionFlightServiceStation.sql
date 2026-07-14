CREATE TABLE FlightInformationRegionFlightServiceStation (
  regionId INTEGER NOT NULL,
  stationId INTEGER NOT NULL,
  PRIMARY KEY (regionId, stationId),
  FOREIGN KEY (regionId) REFERENCES FlightInformationRegion (regionId),
  FOREIGN KEY (stationId) REFERENCES FlightServiceStation (stationId)
);
