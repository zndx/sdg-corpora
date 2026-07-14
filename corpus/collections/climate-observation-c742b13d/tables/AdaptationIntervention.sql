CREATE TABLE AdaptationIntervention (
  id INTEGER NOT NULL,
  interventionId VARCHAR(44),
  interventionType VARCHAR(33),
  startDate DATE,
  endDate DATE,
  status VARCHAR(32),
  budget DECIMAL,
  zoneId VARCHAR(44),
  PRIMARY KEY (id),
  FOREIGN KEY (zoneId) REFERENCES SpatialZone (zoneId)
);
