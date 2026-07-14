CREATE TABLE AircraftCommunicationSystem (
  aircraftId INTEGER NOT NULL,
  systemId INTEGER NOT NULL,
  PRIMARY KEY (aircraftId, systemId),
  FOREIGN KEY (aircraftId) REFERENCES Aircraft (id),
  FOREIGN KEY (systemId) REFERENCES CommunicationSystem (id)
);
