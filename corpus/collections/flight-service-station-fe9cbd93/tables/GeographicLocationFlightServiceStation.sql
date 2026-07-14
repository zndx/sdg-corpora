CREATE TABLE GeographicLocationFlightServiceStation (
  locationId INTEGER NOT NULL,
  stationId INTEGER NOT NULL,
  PRIMARY KEY (locationId, stationId),
  FOREIGN KEY (locationId) REFERENCES GeographicLocation (id),
  FOREIGN KEY (stationId) REFERENCES FlightServiceStation (stationId)
);
