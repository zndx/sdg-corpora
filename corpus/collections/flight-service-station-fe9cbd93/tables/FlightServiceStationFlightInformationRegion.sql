CREATE TABLE FlightServiceStationFlightInformationRegion (
  stationId INTEGER NOT NULL,
  regionId INTEGER NOT NULL,
  PRIMARY KEY (stationId, regionId),
  FOREIGN KEY (stationId) REFERENCES FlightServiceStation (stationId),
  FOREIGN KEY (regionId) REFERENCES FlightInformationRegion (regionId)
);
