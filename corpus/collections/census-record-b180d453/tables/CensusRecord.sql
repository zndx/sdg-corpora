CREATE TABLE CensusRecord (
  id INTEGER NOT NULL,
  censusYear INTEGER,
  totalPopulation INTEGER,
  region VARCHAR(32),
  dataStatus VARCHAR(32),
  recordIdentifier VARCHAR(32),
  regionId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (regionId) REFERENCES GeographicRegion (id)
);
