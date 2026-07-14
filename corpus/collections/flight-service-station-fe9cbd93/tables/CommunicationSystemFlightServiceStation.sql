CREATE TABLE CommunicationSystemFlightServiceStation (
  systemId INTEGER NOT NULL,
  stationId INTEGER NOT NULL,
  PRIMARY KEY (systemId, stationId),
  FOREIGN KEY (systemId) REFERENCES CommunicationSystem (id),
  FOREIGN KEY (stationId) REFERENCES FlightServiceStation (stationId)
);
