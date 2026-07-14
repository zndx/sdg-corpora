CREATE TABLE FlightServiceStationAirTrafficController (
  stationId INTEGER NOT NULL,
  controllerId VARCHAR(32) NOT NULL,
  PRIMARY KEY (stationId, controllerId),
  FOREIGN KEY (stationId) REFERENCES FlightServiceStation (stationId),
  FOREIGN KEY (controllerId) REFERENCES AirTrafficController (controllerId)
);
