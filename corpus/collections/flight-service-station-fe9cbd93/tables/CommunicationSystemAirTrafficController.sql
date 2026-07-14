CREATE TABLE CommunicationSystemAirTrafficController (
  systemId INTEGER NOT NULL,
  controllerId VARCHAR(32) NOT NULL,
  PRIMARY KEY (systemId, controllerId),
  FOREIGN KEY (systemId) REFERENCES CommunicationSystem (id),
  FOREIGN KEY (controllerId) REFERENCES AirTrafficController (controllerId)
);
