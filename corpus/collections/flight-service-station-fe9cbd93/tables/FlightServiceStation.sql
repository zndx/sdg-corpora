CREATE TABLE FlightServiceStation (
  stationId INTEGER NOT NULL,
  stationIdentifier VARCHAR(32),
  stationName VARCHAR(32),
  establishmentDate DATE,
  operationalStatus VARCHAR(32),
  coverageArea DECIMAL,
  primaryCommunicationMode VARCHAR(32),
  parentOrganization VARCHAR(32),
  locationCity VARCHAR(32),
  locationProvince VARCHAR(32),
  locationId INTEGER,
  PRIMARY KEY (stationId),
  FOREIGN KEY (locationId) REFERENCES GeographicLocation (id)
);
