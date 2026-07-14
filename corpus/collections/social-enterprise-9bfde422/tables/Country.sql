CREATE TABLE Country (
  id INTEGER NOT NULL,
  countryCode VARCHAR(44),
  countryName VARCHAR(32),
  totalPopulation INTEGER,
  totalSocialEnterprises INTEGER,
  regionId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (regionId) REFERENCES GeographicRegion (id)
);
