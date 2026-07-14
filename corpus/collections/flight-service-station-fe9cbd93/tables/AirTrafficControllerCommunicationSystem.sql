CREATE TABLE AirTrafficControllerCommunicationSystem (
  controllerId VARCHAR(32) NOT NULL,
  systemId INTEGER NOT NULL,
  PRIMARY KEY (controllerId, systemId),
  FOREIGN KEY (controllerId) REFERENCES AirTrafficController (controllerId),
  FOREIGN KEY (systemId) REFERENCES CommunicationSystem (id)
);
