CREATE TABLE GolfClub (
  id INTEGER NOT NULL,
  clubId VARCHAR(32),
  clubType VARCHAR(32),
  material VARCHAR(32),
  length DECIMAL,
  weight DECIMAL,
  loft DECIMAL,
  PRIMARY KEY (id)
);
