CREATE TABLE TestProtocol (
  protocolId INTEGER NOT NULL,
  protocolVersion VARCHAR(32),
  measurementUnit VARCHAR(32),
  witnessingRequired BOOLEAN,
  testEnvironment VARCHAR(32),
  temperatureCelsius DECIMAL,
  pressureBar DECIMAL,
  typeId INTEGER,
  facilityId VARCHAR(44),
  regulationId INTEGER,
  PRIMARY KEY (protocolId),
  FOREIGN KEY (typeId) REFERENCES TyreType (id),
  FOREIGN KEY (facilityId) REFERENCES TestFacility (facilityId),
  FOREIGN KEY (regulationId) REFERENCES Regulation (regulationId)
);
