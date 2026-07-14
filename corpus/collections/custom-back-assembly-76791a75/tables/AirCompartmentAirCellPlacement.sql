CREATE TABLE AirCompartmentAirCellPlacement (
  compartmentId VARCHAR(44) NOT NULL,
  placementId INTEGER NOT NULL,
  PRIMARY KEY (compartmentId, placementId),
  FOREIGN KEY (compartmentId) REFERENCES AirCompartment (compartmentId),
  FOREIGN KEY (placementId) REFERENCES AirCellPlacement (id)
);
