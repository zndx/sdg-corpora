CREATE TABLE SpatialZoneClimateObservation (
  zoneId VARCHAR(44) NOT NULL,
  observationId INTEGER NOT NULL,
  PRIMARY KEY (zoneId, observationId),
  FOREIGN KEY (zoneId) REFERENCES SpatialZone (zoneId),
  FOREIGN KEY (observationId) REFERENCES ClimateObservation (observationId)
);
