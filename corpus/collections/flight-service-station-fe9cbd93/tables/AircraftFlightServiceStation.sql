CREATE TABLE AircraftFlightServiceStation (
  aircraftId INTEGER NOT NULL,
  stationId INTEGER NOT NULL,
  PRIMARY KEY (aircraftId, stationId),
  FOREIGN KEY (aircraftId) REFERENCES Aircraft (id),
  FOREIGN KEY (stationId) REFERENCES FlightServiceStation (stationId)
);
