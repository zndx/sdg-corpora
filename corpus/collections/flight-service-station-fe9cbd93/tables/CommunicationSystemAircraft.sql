CREATE TABLE CommunicationSystemAircraft (
  systemId INTEGER NOT NULL,
  aircraftId INTEGER NOT NULL,
  PRIMARY KEY (systemId, aircraftId),
  FOREIGN KEY (systemId) REFERENCES CommunicationSystem (id),
  FOREIGN KEY (aircraftId) REFERENCES Aircraft (id)
);
