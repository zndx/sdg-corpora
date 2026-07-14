CREATE TABLE SpatialZoneFisherman (
  zoneId VARCHAR(44) NOT NULL,
  fishermanId INTEGER NOT NULL,
  PRIMARY KEY (zoneId, fishermanId),
  FOREIGN KEY (zoneId) REFERENCES SpatialZone (zoneId),
  FOREIGN KEY (fishermanId) REFERENCES Fisherman (id)
);
