CREATE TABLE PopulationGroup (
  id INTEGER NOT NULL,
  groupName VARCHAR(32),
  ageRangeStart INTEGER,
  ageRangeEnd INTEGER,
  totalCount INTEGER,
  percentageOfTotal DECIMAL,
  regionId INTEGER,
  indicatorId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (regionId) REFERENCES GeographicRegion (id),
  FOREIGN KEY (indicatorId) REFERENCES HealthIndicator (id)
);
