CREATE TABLE GeographicRegionPopulationGroup (
  regionId INTEGER NOT NULL,
  groupId INTEGER NOT NULL,
  PRIMARY KEY (regionId, groupId),
  FOREIGN KEY (regionId) REFERENCES GeographicRegion (id),
  FOREIGN KEY (groupId) REFERENCES PopulationGroup (id)
);
