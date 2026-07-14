CREATE TABLE FlightServiceStationCommunicationSystem (
  stationId INTEGER NOT NULL,
  systemId INTEGER NOT NULL,
  PRIMARY KEY (stationId, systemId),
  FOREIGN KEY (stationId) REFERENCES FlightServiceStation (stationId),
  FOREIGN KEY (systemId) REFERENCES CommunicationSystem (id)
);
